module Api
  class CurrentUserController < ApiApplicationController
    before_action :authenticate_user!

    def index
      render json: UserBlueprint.render(current_user, view: :products), status: :ok
    end
  end
end
