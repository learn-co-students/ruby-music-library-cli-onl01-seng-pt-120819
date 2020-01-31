class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
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
  
  def self.create(new_genre)
    new_genre = Genre.new(new_genre)
    new_genre.save
    new_genre
  end 
  
  def artists
    # Artist.all.select {|artist| artist.genre == self}
    songs.collect(&:artist).uniq 
  end 
  
  def songs 
    @songs 
  end 
  
end 