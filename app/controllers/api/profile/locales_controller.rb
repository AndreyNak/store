# frozen_string_literal: true

module Api
  module Profile
    class LocalesController < ApiApplicationController
      def set_locale
        if current_user.update(user_locale_params)
          render json: { message: 'Locale updated successfully' }
        else
          render json: { error: 'Failed to update locale' }, status: :unprocessable_entity
        end
      end

      private

      def user_locale_params
        params.require(:user).permit(:locale)
      end
    end
  end
end
