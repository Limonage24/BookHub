class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]
  before_action :set_user, only: %i[update]
  before_action :admin_access, only: %i[destroy]
  before_action :current?, only: %i[update]

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(**comment_params, user_id: current_user.id, deleted: false)

    respond_to do |format|
      if !@comment.content.empty? && @comment.save
        format.html { redirect_to book_url(@comment.book) }
        format.json { render 'books/show', status: :created, location: @comment }
      else
        format.html { redirect_to book_url(@comment.book), status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to book_url(@comment.book)}
        format.json { render 'books/show', status: :ok, location: @comment }
      else
        format.html { render book_url(@comment.book), status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.content = 'Комментарий был удалён.'
    @comment.deleted = true
    @comment.save

    respond_to do |format|
      format.html { redirect_to book_url(@comment.book) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :book_id, :reply_to_id)
  end

  def comment_user_params
    params.require(:user).permit(:id)
  end

  def set_user
    @user = User.find(comment_user_params[:id])
  end
end
