class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_issue

  def create
    @comment = @issue.comments.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to issue_url(@issue), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = @issue.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to issue_url(@issue), notice: "Comment was successfully updated." }
      else
        format.html { redirect_to issue_url(@issue), alert: "Comment was not updated." }
      end
    end
  end

  def destroy
    @comment = @issue.comments.find(params[:id])
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to issue_url(@issue), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end 

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:issue_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
