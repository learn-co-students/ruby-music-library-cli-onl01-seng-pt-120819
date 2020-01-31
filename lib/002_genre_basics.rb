class Genre

  extend Concerns::Findable

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

  def songs
    @songs
  end

  def artists
    new_arr = []
    @songs.collect{|song| new_arr << song.artist}
    new_arr.uniq
  end

end
