class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.recommendation_id = params[:recommendation_id]
    if @comment.save
      redirect_to recommendation_path(params[:recommendation_id])
    else
      flash[:message] = "The new comment failed to be created."
      redirect_to recommendation_path(params[:recommendation_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recommendation = Recommendation.find(params[:recommendation_id])
    if session[:user_id] == @comment.user_id
      @comment = Comment.destroy(params[:id])
      flash[:message] = "Comment deleted successully."
      redirect_to recommendation_path(@recommendation)
    else
      flash[:message] = "Comment can only be deleted by the user that created it."
      redirect_to recommendation_path(@recommendation)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :recommendation_id)
  end

end
