# frozen_string_literal: true

module Support
  class MainController < ApplicationController
    before_action :authenticate_user!

    def index
      @chats = current_user.chats
    end
  end
end
