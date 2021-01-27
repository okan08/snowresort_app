class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/snowresorts/#{comment.comment.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, snowresort_id: params[:user_id])
  end

end
