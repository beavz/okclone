module Api
  class PicturesController < ApiController
    wrap_parameters :picture, include: [:album_id, :caption, :image]

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
      @picture = current_user.pictures.new(picture_params)
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
