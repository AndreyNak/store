# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!

    protected

    def authenticate_admin!
      authenticate_user!

      raise Pundit::NotAuthorizedError unless current_user.admin?
    end
  end
end
