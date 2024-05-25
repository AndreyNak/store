module Api
  class CurrentUserController < ApiApplicationController
    def index
      if current_user
        render json: UserBlueprint.render(current_user, view: :products), status: :ok
      else
        render json: nil, status: :ok
      end
    end
  end
end
