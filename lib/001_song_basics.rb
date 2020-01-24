require 'pry'
class Song
    
    attr_accessor :name, :artist, :genre
    
    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name 
        artist != nil ? self.artist=(artist) : nil
        genre != nil ? self.genre=(genre) : nil
        save
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

    def self.find_by_name(name)
        @@all.detect {|sn| sn.name == name }
    end

    def self.find_or_create_by_name(name)
        if self.find_by_name(name)
            self.find_by_name(name)
        else 
            self.create(name)
        end 
    end

    # binding.pry
end