require_relative '../lib/concerns/findable'
require 'pry'

class Song
     extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  
   @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist!=nil
    self.genre = genre if genre!=nil
  end
  
  def self.all
   @@all
  end
  
  def save
   @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
   new_song = Song.new(name)
   new_song.save
   new_song
 end
 
 def artist=(artist)
  @artist = artist
  artist.add_song(self)
 end
 
 def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
 end 
 
def self.find_by_name(name)
  @@all.detect{|song| song.name == name}
end
 
 def self.find_or_create_by_name(name)
   if self.find_by_name(name)
     self.find_by_name(name)
   else
     self.create(name)
  end
 end
 
 def self.new_from_filename(file_name)
   input = file_name.split(" - ")
   song_name = input[1]
   artist_name = input[0]
   genre_name = input[2].chomp!(".mp3")
  
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  
  self.new(song_name, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
 
 
end