# frozen_string_literal: true

module Api
  module Admin
    module Users
      class RestrictionsController < Admin::BaseController
        def index
          render json: {
            activeOffenses: RestrictionBlueprint.render_as_json(offenses.active),
            offenses: RestrictionBlueprint.render_as_json(offenses)
          }
        end

        def cancel
          authorize [:users, offense]

          @offense = UserCancelRestrictionService.new(user, params[:canceller_id]).cancel(offense)

          render json: RestrictionBlueprint.render(offense)
        end

        private

        def user
          @user ||= User.find(params[:user_id])
        end

        def offenses
          @offenses ||= user.offenses.includes(:canceller, :officer, :permission, :offender).order(created_at: :desc)
        end

        def offense
          @offense ||= user.offenses.active.find(params[:id])
        end
      end
    end
  end
end
