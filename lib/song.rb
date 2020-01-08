class Song
    extend Concerns::Findable 
    
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name 
        @artist = artist
        @genre = genre 
        self.save  
    end

    def self.all 
        @@all 
    end

    def self.destroy_all
        all.clear 
    end

    def save
        @@all << self 
    end

    def self.create(name)
        new_song = Song.new(name)
        new_song.save 
        new_song
    end
end
