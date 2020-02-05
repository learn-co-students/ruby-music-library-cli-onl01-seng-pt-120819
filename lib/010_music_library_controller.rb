class MusicLibraryController

  attr_accessor :song, :artist

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ''
    while input != "exit"
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

    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    else
      "exit"
    end
    input = gets
  end
  end

  def list_songs
    Song.all.sort_by{|s| s.name}.each_with_index{|s, index|
      puts "#{index + 1}. " + "#{s.artist.name} - #{s.name} - #{s.genre.name}"
    }
  end

  def list_artists
    Artist.all.sort.each {|a| print a}
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
