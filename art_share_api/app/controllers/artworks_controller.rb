class ArtworksController < ApplicationController
  def index
    art = Artwork.artwork_for_user(params[:user_id])
    render json: art
  end

  def show
    art = Artwork.find(params[:id])
    render json: art
  end

  def update
    art = Artwork.find(params[:id])
    if art.update(art_params)
      render json: art
    else
      render json: art.errors.full_messages, status: 422
    end
  end

  def destroy
    art = Artwork.find(params[:id])
    art.destroy
    redner json: ['burned it']
  end

  def create
    art = Artwork.new(art_params)
    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: 422
    end
  end

  private

  def art_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
