module Api
  class PicturesController < ApiController

    def index
      album = Album.find(params[:album_id])
      @pictures = Album.pictures
      render :index
    end

    def show
      @picture = Picture.find(params[:id])

      render :show
    end

    def create
      album = current_user.albums.find(params[:album_id])
      @picture = album.pictures.new(picture_params)
      @picture.save

      render :show
    end

    def destroy
      @picture = current_user.pictures.find()
    end

    private

    def picture_params
      params.require(:picture).permit(:album_id, :caption, :image)
    end
  end
end
