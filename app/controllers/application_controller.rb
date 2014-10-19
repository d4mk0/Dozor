class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :associate_with_team
  before_action :check_team

  private

    def associate_with_team
      @team ||= Team.admitted.find_by access_code: session[:access_code]
    end

    def check_team
      unless params[:controller].match(/^rails_admin/)
        redirect_to root_path unless @team.present?
      end
    end
end
