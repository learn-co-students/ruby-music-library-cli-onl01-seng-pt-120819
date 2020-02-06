class Genre
  attr_accessor :name
  attr_reader :artist, :song
  @@all = []
  
  def initialize (name)
   @name = name
   @songs = []
   @artist = artist
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
    song = Genre.new(name)
    song.save
    song
  end 
  
  def songs 
   @songs 
  end 
end