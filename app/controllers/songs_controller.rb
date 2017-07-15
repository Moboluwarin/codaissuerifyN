class SongsController < ApplicationController
  before_action :set_song, only: [:edit, :update]
  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
     @song =Song.new
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
     @artist = Artist.find(params[:artist_id])
     @song = @artist.songs.create(song_param)


     respond_to do |format|
         if @song.save
           format.html { redirect_to artist_songs_path(@artist.id) , notice: 'Song was successfully created.'}
           format.json { render :show, status: :created, location: @song }
         else
           format.html { redirect_to ([@artist, @song]) }
           format.json { render json: @song.errors, status: :unprocessable_entity }
         end
       end
  end

  private
  def song_param
    params
      .require(:song)
      .permit(
        :title, :song_url
      )
  end

end
