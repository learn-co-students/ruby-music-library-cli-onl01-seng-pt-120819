class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  
  def initialize (name)
   @name = name
   @songs = []
   self.save
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
  
  def artists
    self.songs.collect{|s| s.artist}.uniq
  end 
  
  def songs 
   @songs 
  end 
end