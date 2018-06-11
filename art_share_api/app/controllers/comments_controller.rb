class CommentsController < ApplicationController
  def index
    # debugger
    comment = ''
    if params[:user_id]
      comment = Comment.where(author_id: params[:user_id])
    elsif params[:artwork_id]
      comment = Comment.where(artwork_id: params[:artwork_id])
    end

    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: ['Its gone']
  end

  def create
    coms = Comment.new(com_params)
    if coms.save
      render json: coms
    else
      render json: coms.errors.full_messages, status: 422
    end
  end



  private

  def com_params
    params.require(:comment).permit(:author_id, :artwork_id, :text)
  end
end
