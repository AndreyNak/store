# app/controllers/profiles_controller.rb
class ProfileController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to profile_path, notice: 'Profile updated successfully'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :surname, :date_of_birth, :address)
  end
end
