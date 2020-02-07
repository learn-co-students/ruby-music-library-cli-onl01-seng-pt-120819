require 'pry'
class Artist 
  attr_accessor :name
  @@all = []
  
  def initialize (name)
   @name = name
   @songs = []
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
    # binding.pry
    # Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    if(song.artist.nil?)
      song.artist = self 
      @songs << song
      # binding.pry
    end
  end
 
 def genres
  self.songs.collect{|s| s.genres}.uniq
 end
end 

