require 'pry'
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
    Artist.all.sort_by{|a| a.name}.each_with_index{|a, index|
      puts "#{index + 1}. " + "#{a.name}"
    }
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index{|g, index|
      puts "#{index + 1}. " + "#{g.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      songs_sorted_by_name = artist.songs.sort_by do |song|
        song.name
      end
      songs_sorted_by_name.each_with_index do |song,index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre

    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      songs_sorted_by_name = genre.songs.sort_by do |song|
        song.name
      end

      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    
    input = gets.strip.to_i
    #if (input > 0) && (input <= list_of_songs.size)
    #if (input >= 1) && (input <= list_of_songs.size)
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by{|s| s.name}[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
