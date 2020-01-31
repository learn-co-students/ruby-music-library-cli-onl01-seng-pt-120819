class Genre 
  attr_accessor :name, :artist, :songs
  extend Concerns::Findable
  
  @@all =[]
  
  def initialize(name)
      @name = name
      @songs =[]
      # @artist = artist
      # @genre = genre
      # @@all << self 
  end 
  
  def self.all 
      @@all 
  end 
  
  def self.destroy_all 
      self.all.clear
  end 
  
  def save
     @@all << self
  end 
  
  def self.create(name)
      genre_type = self.new(name)
      genre_type.save
      genre_type
       
  end 
  
  def artists
      songs.collect{|s|s.artist}.uniq
  end 
end  




