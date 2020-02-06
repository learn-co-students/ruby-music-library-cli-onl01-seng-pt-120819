require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

class Song 
  attr_accessor :artist, :name, :genre
  
  
  @@all = []
  
  def initialize (name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
   @genre
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
    song = Song.new(name)
    song.save
    song
  end 
  
  def genre
    @genre
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
end

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
  