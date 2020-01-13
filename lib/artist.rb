require 'pry'

class Artist 
    extend Concerns::Findable 

    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
        @songs = []
    end

    def self.all
        @@all 
    end

    def self.destroy_all
        self.all.clear 
    end

    def save
        @@all << self 
    end

    def self.create(name)
        self.new(name)
    end 

    def add_song(song) 
        if song.artist == nil
            song.artist = self  
        end
        if !self.songs.include?(song)
            songs << song 
        end
    end

    def songs 
        @songs 
    end

    def genres
        songs.collect do |song|
            song.genre
        end.uniq  
    end
end
