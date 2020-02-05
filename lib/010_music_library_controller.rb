class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts_stmnts = case 
    input = ''
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets

    case
      when input == "list songs"
      list_songs
    when input == "list artists"
        list_artists
      when input == "list genres"
          list_genres
        when input == "list artist"
            list_songs_by_artist
          when input == "list genre"
              list_songs_by_genre
            when input == "play song"
                play_song

              when input != "exit"
                input = gets
              else
                "exit"
              end
end

def list_songs
  Song.all
end

def list_artists
Artist.all
end

def list_genres
  Genre.all
end

def list_songs_by_artist
end

def list_songs_by_genre
end

def play_song
end
            end
