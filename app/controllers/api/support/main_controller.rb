# frozen_string_literal: true

module Api
  module Support
    class MainController < ApiApplicationController
      before_action :authenticate_user!

      def index
        render json: ChatBlueprint.render(current_user.chats)
      end
    end
  end
end
