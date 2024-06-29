module Api
  module Profile
    class RestrictionsController < ApiApplicationController
      def index
        render json: RestrictionBlueprint.render(current_user.offenses.active.order(created_at: :desc))
      end
    end
  end
end
