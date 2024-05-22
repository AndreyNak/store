# frozen_string_literal: true

module Api
  module Support
    class MainController < ApiApplicationController
      before_action :authenticate_user!

      def index
        @chats = current_user.chats

        render json: ChatBlueprint.render(@chats)
      end
    end
  end
end
