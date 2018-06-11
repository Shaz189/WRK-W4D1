class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(shares_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])
    share.destroy
    render json: ['bye share']
  end

  private
  def shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
