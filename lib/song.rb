class Song 
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist 
    self.genre = genre 
  end 
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def artist=(artist)
    if @artist == nil
      @artist = artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  
  def genre=(genre)
    if @genre == nil 
      @genre = genre 
    end 
    if self.genre != nil 
      @genre.add_song(self)
    end 
  end
  
  def self.find_by_name(name)
    self.all.detect { | song | song.name == name} 
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
     else
       self.create(name)
     end 
   end 
   
   def self.new_from_filename(filename)
     artist_name = filename.split(" - ")[0]
     song_name = filename.split(" - ")[1]
     genre_name = filename.split(" - ")[2].chomp(".mp3")
     song = Song.new(song_name)
     song.artist = Artist.find_or_create_by_name(artist_name)
     song.genre = Genre.find_or_create_by_name(genre_name)
     song 
   end 
   
   def self.create_from_filename(filename)
     self.all << self.new_from_filename(filename)
   end 
  
  
end 