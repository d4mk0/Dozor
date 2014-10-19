class TasksController < ApplicationController
  before_action :set_task
  before_action :check_start_time
  before_action :check_progress, only: :show
  before_action :check_completing_task, only: :show

  def attempt
    if params[:attempt].present?
      if @task.code_task?
        @attempt = Attempt.create(task: @task, team: @team, code: params[:attempt][:code])
        if @attempt.success?
          flash[:notice] = t('code.success')
        else
          flash[:error] = t('code.incorrect')
        end
        redirect_to quest_task_path(@task.quest, @team.current_task)
      end
    end
  end

  private

    def set_task
      @task = Task.published.find params[:id]
    end

    def check_start_time
      return if @task.quest.in_progress?
      redirect_to expected_quest_path if Time.now < @task.quest.start_at
    end

    def check_progress
      redirect_to complete_quest_path(@task.quest) if @team.complete_quest?
    end

    def check_completing_task
      redirect_to quest_task_path(@team.quest, @team.current_task) if @task.completed_by? @team
    end
end
