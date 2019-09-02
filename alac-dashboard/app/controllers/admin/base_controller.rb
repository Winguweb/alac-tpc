class Admin::BaseController < ApplicationController
  before_action :authorized?

  private
    def authorized?
      unless current_user.present? and current_user.admin?
        redirect_to root_path
      end
    end
end