class Artist 
  attr_accessor :name
  attr_reader :songs, :genre
  @@all = []
  
  def initialize (name)
   @name = name
   @songs = []
   @genre = genre
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
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    if(song.artist.nil?)
      song.artist = self 
      @songs << song
    end
  end
 
 def genres
  self.songs.collect{|s| s.genre}.uniq
 end
end 

