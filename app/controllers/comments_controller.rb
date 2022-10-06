class CommentsController < ApplicationController
  def create
    @condition = DailyCondition.find(params[:daily_condition_id])
    @comment = @condition.comments.build(comment_params)

    
    respond_to do |format|
      if @comment.save!
        format.js { render :index }     
      else
        format.html { redirect_to daily_condition_path(@condition), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
