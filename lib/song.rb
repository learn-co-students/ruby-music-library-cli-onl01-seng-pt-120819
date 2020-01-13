class Song
    extend Concerns::Findable 

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name 
        if artist != nil 
            self.artist=(artist)
        end
        if genre != nil 
            self.genre=(genre)
        end
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

    def artist=(artist)
        @artist = artist 
        @artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        @genre.add_song(self)
    end

    def self.new_from_filename(filename)
        song = self.find_or_create_by_name(filename.split(" - ")[1])
        song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
        song 
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save 
    end
end
