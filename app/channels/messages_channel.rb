# frozen_string_literal: true

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'MessagesChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def receive(data)
  #   ActionCable.server.brodcast 'MessagesChannel', data
  # end
end
