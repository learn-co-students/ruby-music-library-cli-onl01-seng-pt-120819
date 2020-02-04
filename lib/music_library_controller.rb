#CLI
class MusicLibraryController
  attr_accessor :path 
  attr_writer :list_songs

  def initialize(path = "./db/mp3s")
    @path = path 
   y = MusicImporter.new(path)
   y.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
      
    answer = ""
    while answer != "exit"
      answer = gets.chomp
      if answer == "list songs"
        list_songs
      elsif answer == 'list artists'
        list_artists
      elsif answer == 'list genres'
        list_genres
      elsif answer == 'list artist'
        list_songs_by_artist
      elsif answer == 'list genre'
        list_songs_by_genre
      elsif answer == 'play song'
        play_song
      end
    end
  end
  
  def list_songs
    sorted_list = Song.all.sort_by{|song| song.name}
    sorted_list.each.with_index(1) {|song, index| #song is a class
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
  end
  
  def list_artists
    sorted_list = Artist.all.sort_by{|artist| artist.name}
    sorted_list.each.with_index(1) {|artist, index| #song is a class
      puts "#{index}. #{artist.name}"
    }
  end
  
  def list_genres
    sorted_list = Genre.all.sort_by{|genre| genre.name}
    sorted_list.each.with_index(1) {|genre, index| #song is a class
      puts "#{index}. #{genre.name}"
    }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    
    x = Song.all.select{|song| song.artist.name == gets.chomp}
    
    sorted_list = x.sort_by{|song| song.name} #temp variable does not matter, whats important is the method called
    
    sorted_list.each.with_index(1) {|song, index| #song is a class
      puts "#{index}. #{song.name} - #{song.genre.name}"
    }
  end
 
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    
    x = Song.all.select{|song| song.genre.name == gets.chomp}
    
    sorted_list = x.sort_by{|song| song.name} #temp variable does not matter, whats important is the method called
    
    sorted_list.each.with_index(1) {|song, index| #song is a class
      puts "#{index}. #{song.artist.name} - #{song.name}"
    }
  end
  
  def play_song
    puts "Which song number would you like to play?"
    
    num = gets.chomp
    num = num.to_i
    
    sorted_list = Song.all.sort_by{|song| song.name} #extracted from list_songs
    
    if num > 0 && num <= sorted_list.length 
      song = sorted_list[num-1].name
      artist = sorted_list[num-1].artist.name
      puts "Playing #{song} by #{artist}"
    end
  end


end



