class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    class_instance = self.new(name)
    class_instance.save
    class_instance
  end

  def add_song(song)

    if !@songs.include?(song)
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    new_arr = []
    @songs.each{|song| new_arr << song.genre}
    new_arr.uniq
  end
end
