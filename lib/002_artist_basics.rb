require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable
   
@@all = []

attr_accessor :name

def initialize(name)
@name = name
save
end

def save
@@all << self
end

def self.all
@@all
end

def self.destroy_all
@@all.clear
end

def self.create
self.new.save
end

def add_song(song)
  @songs << song
  song.artist = self
end

def genres(song)
  artist.song = Genre.new(song)
end




end
