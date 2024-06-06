# frozen_string_literal: true

module Imageble
  extend ActiveSupport::Concern

  def small
    { resize_to_limit: [160, 120] }
  end

  def medium
    { resize_to_limit: [316, 240] }
  end

  def large
    { resize_to_limit: [550, 400] }
  end

  def custome(width:, height:)
    { resize_to_limit: [width, height] }
  end

  def base_url(size, params = {})
    return unless image.attached?

    "http://192.168.1.7:3000#{polymorphic_url(image.variant(public_send(size, **params)), only_path: true)}"
  end
end
