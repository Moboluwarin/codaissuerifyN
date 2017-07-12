class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :update]
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
  end
  def show
   end

   def set_song
    @song = Song.find(params[:id])
  end
  def new

     @song =Song.new

   end
   def create
     @song = Song.new(params[:Song])

    if @song.save
      redirect_to @song, notice: "Song Saved"
    else
      render :new
    end
  end

end
