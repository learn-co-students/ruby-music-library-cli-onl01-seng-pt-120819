require 'pry'
class Genre
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
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

    def self.create(genre)
        new_genre = self.new(genre)
        new_genre.save
        new_genre
    end 

    def songs
        @songs
    end

    def artists
        # @@all.collect do |x|
        #     x.songs.collect do |y|
        #         y.artist == self
        #     end 
        # end
        # binding.pry
        self.songs.collect {|song| song.artist }.uniq
    end
end