json.extract! song, :id, :title, :created_at, :updated_at
json.url artist_songs_path(@artist.id)
