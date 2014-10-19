class SessionsController < ApplicationController
  before_action :check_team, except: [:create, :login]

  def create
    if params[:login].present?
      @team = Team.admitted.find_by access_code: params[:login][:code]
      
      if @team.present?
        session[:access_code] = @team.access_code
      end
    end
    redirect_to root_path
  end

  def destroy
    session.delete(:access_code)
    redirect_to root_path
  end

  def login
    redirect_to quest_path(@team.quest) if @team.present?
  end
end
