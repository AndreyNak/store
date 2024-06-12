# frozen_string_literal: true

class CommentCreateService
  attr_reader :comment

  def initialize(product, params)
    @comment = product.comments.new(params)
    @product_name = product.name
  end

  def call
    return unless @comment.parent.present? && @comment.user.id != @comment.parent.user.id

    I18n.with_locale(@comment.parent.user&.locale || I18n.default_locale) do
      msg = I18n.t(
        'notifications.reply_comment',
        replyer: @comment.user.login,
        parent_comment: @comment.parent.text.truncate(20),
        reply: @comment.text,
        product: @product_name
      )

      SendNotificationService.new(@comment.parent).call(msg)
    end
  end
end
