require 'pry'

class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
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
  
  def self.create(new_artist)
    new_artist = Artist.new(new_artist)
    new_artist.save 
    new_artist 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end 
  
  def songs 
    @songs 
  end 
  
  def genres  
    # Genre.all.select {|genre| genre.artist == self}
    songs.collect(&:genre).uniq 
  end 
  
end 