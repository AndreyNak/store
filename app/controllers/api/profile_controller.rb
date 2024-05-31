# frozen_string_literal: true

module Api
  class ProfileController < ApiApplicationController
    before_action :authenticate_user!

    def update
      if current_user.update(profile_params)
        render json: { notice: 'Profile updated successfully' }
      else
        render json: { errors: current_user.errors.full_messages }, status: :bad_request
      end
    end

    private

    def profile_params
      params.require(:user).permit(:name, :surname, :date_of_birth, :login, :address)
    end
  end
end
