class MusicLibraryController
    attr_accessor :path 

    def initialize(path = './db/mp3s')
        @path = path 
        MusicImporter.new(path).import 
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
        
        input = gets.chomp

        if input == "list songs"
            list_songs
            elsif input == "list artists"
                list_artists
            elsif input == "list genres"
                list_genres
            elsif input == "list artist"
                list_songs_by_artist
            elsif input == "list genre"
                list_songs_by_genre
            elsif input == "play song"
                play_song
        end    

        until input == "exit" do 
            input = gets.chomp 
        end

    end

    def list_songs
        sorted_songs = Song.all.sort { |a, b| a.name <=> b.name }.uniq 

        sorted_songs.each_with_index do |song, index| 
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort { |a,b| a.name <=> b.name }

        sorted_artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end 

    def list_genres
        sorted_genres = Genre.all.sort { |a,b| a.name <=> b.name }
        sorted_genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp 

        Artist.all.each do |artist|
            if artist.name == input 
                sorted_songs = artist.songs.sort { |a,b| a.name <=> b.name }.uniq 
                sorted_songs.each_with_index do |song, index|
                    puts "#{index + 1}. #{song.name} - #{song.genre.name}"
                end
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp 
        Genre.all.each do |genre|
            if genre.name == input
                sorted_songs = genre.songs.sort { |a, b| a.name <=> b.name }.uniq 
                sorted_songs.each_with_index do |song, index|
                    puts "#{index + 1}. #{song.artist.name} - #{song.name}"
                end
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.chomp.to_i  

        sorted_songs = Song.all.sort { |a, b| a.name <=> b.name }.uniq 
        
        # sorted_songs.each_with_index do |song, index| 
        #     if input.to_i == (index + 1)
        #         puts "Playing #{song.name} by #{song.artist.name}"
        #     end
        # end

        if (1..sorted_songs.length).include?(input) 
            selected_song = sorted_songs[input - 1]
            puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
        end
    end
end