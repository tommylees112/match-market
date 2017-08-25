class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @match = Match.find(params[:match_id])
    @comment.match = @match
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.html { redirect_to match_path(@match) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'matches/show' }
        format.js  # <-- idem
      end
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
