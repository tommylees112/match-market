class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.match = Match.find(params[:match_id])
    @comment.user = current_user
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
