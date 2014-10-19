class QuestsController < ApplicationController
  before_action :set_quest
  before_action :check_expected_time, only: :expected
  before_action :check_team, except: :results
  before_action :check_time_for_result_displaying, only: :results

  def show
    redirect_to quest_task_path(@quest, @team.current_task)
  end

  def results
    @finished_teams = @quest.finished_teams
  end

  private

    def set_quest
      @quest = Quest.published.find params[:id]
    end

    def check_expected_time
      redirect_to quest_task_path(@quest, @team.current_task) if @quest.in_progress?
    end

    def check_time_for_result_displaying
      unless @quest.results_available?
        flash[:error] = t 'results.access_denied'
        redirect_to root_path
      end
    end
end
