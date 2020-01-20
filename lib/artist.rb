require_relative "../config/environment.rb"
class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

    save #@@all << self
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
  end

  def songs
    @songs
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end

  def add_song(song)
    song.artist = self unless song.artist # defaults artist to self unless otherwise stated
    songs << song unless songs.include?(song) # adds song to artist's songs unless it is already there
  end

end
