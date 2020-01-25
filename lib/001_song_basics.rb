require 'pry'
# require_relative 'concerns/findable.rb'
class Song
    
    
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre
    
    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name 
        artist != nil ? self.artist=(artist) : nil
        genre != nil ? self.genre=(genre) : nil

    end

    def self.all 
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(song)
        new_song = Song.new(song)
        new_song.save
        new_song
    end 

    def artist=(artist)
        @artist = artist
        @artist.add_song(self)
    end

    def genre
       @genre
    end

    def genre=(genre)
        @genre = genre 
        if genre.songs.include?(self)
            return
        else 
            genre.songs << self
        end
    end

    def self.new_from_filename(filename)
        filename_array = filename.split(" - ") #formatting the filename
        filename_artist = filename_array[0]
        filename_song = filename_array[1]
        filename_genre = filename_array[2].split('.mp3').join()
        artist = Artist.find_or_create_by_name(filename_artist)
        genre = Genre.find_or_create_by_name(filename_genre)


        new(filename_song, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end
    # binding.pry
end