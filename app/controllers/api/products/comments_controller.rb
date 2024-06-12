# frozen_string_literal: true

module Api
  module Products
    class CommentsController < ApiApplicationController
      MAX_ITEMS_ON_PAGE = 10

      before_action :check_policy, only: %i[create toggle_like]

      def index
        render json: CommentBlueprint.render_as_json(ordering_comments(paginate_comments))
      end

      def create
        service = CommentCreateService.new(product, comment_params)

        if service.comment.save
          service.call

          render json: CommentBlueprint.render(service.comment), status: :created
        else
          render json: { errors: service.comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        authorize comment

        if @comment.update(comment_params)
          render json: CommentBlueprint.render(@comment), status: :ok
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        authorize comment

        @comment.destroy

        render json: { notice: 'Comment removed!' }, status: :ok
      end

      def toggle_like
        authorize comment

        service = LikeCreateService.new(comment, params)

        if service.like.active?
          service.like.deactivate
        else
          service.like.activate
          service.call
        end

        render json: CommentBlueprint.render(comment), status: :created
      end

      def sub_comments
        render json: CommentBlueprint.render(ordering_comments(comment.children))
      end

      private

      def ordering_comments(comments)
        comments
          .left_joins(:likes)
          .group('comments.id')
          .order('COUNT(comment_likes) DESC')
          .includes(:children, :user, likes: :user)
      end

      def paginate_comments
        @paginate_comments ||= PaginationService.new(product.comments.roots,
                                                     MAX_ITEMS_ON_PAGE).infinite_scroll(params[:page])
      end

      def product
        @product ||= Product.find(params[:product_id])
      end

      def comment
        @comment ||= product.comments.find(params[:id] || params[:comment_id])
      end

      def check_policy
        authorize Comment
      end

      def comment_params
        params.require(:comment).permit(:text, :rating, :user_id, :parent_id)
      end
    end
  end
end
