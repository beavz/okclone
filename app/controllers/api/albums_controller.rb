module Api
  class AlbumsController < ApiController

    def index
      user = User.find(params[:user_id])
      @albums = user.albums
      render :index
    end

    def show
      @album = Album.find(params[:id])
      render :show
    end

    def create
      @album = current_user.albums.new(album_params)
      @album.save

      render :show
    end

    def destroy
      @album = Album.find(params[:id])
      @album.delete

      render :show
    end

    private

    def album_params
      params.require(:album).permit(:user_id, :name)
    end
  end
end
