class LikeCreateService
  attr_reader :like, :comment

  def initialize(comment, params)
    @new = nil
    @like = find_or_new(comment, params)
    @comment = comment
  end

  def call
    return if my_comment?
    return unless new?

    I18n.with_locale(comment.user&.locale || I18n.default_locale) do
      msg = I18n.t('notifications.like_comment', liker: like.user.login, liked_comment: comment.text.truncate(20))
      SendNotificationService.new(comment).call(msg)
    end
  end

  private

  def find_or_new(comment, params)
    if comment.likes.exists?(user_id: params[:user_id])
      comment.likes.find_by(user_id: params[:user_id])
    else
      @new = true
      comment.likes.build(user_id: params[:user_id], active: false)
    end
  end

  def new?
    !!@new
  end

  def my_comment?
    comment.user.id != like.user.id
  end
end
