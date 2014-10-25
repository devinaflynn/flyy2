class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    app = App.find(params[:app_id])
    @comment.app_id = app.id

    # TODO: hundle if @comment.errors?
    respond_to do |format|
      format.js {
        @comments = app.comments.order(created_at: :desc)
        @comment.save
        render 'success'
      }
    end
  end

  def get_comments_by_app
    @app = App.find(params[:app_id])
    @comments = @app.comments.order(created_at: :desc)

    respond_to do |format|
      format.js {
        render 'comments_by_app'
      }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
