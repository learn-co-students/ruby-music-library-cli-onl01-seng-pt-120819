require_relative './concerns/findable'

class Genre
  extend Concerns::Findable
  
@@all = []

attr_accessor :name

def initialize(name)
@name = name
@songs = []
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

def artists(song)
  genre.song = Artist.new(song)
end


end
