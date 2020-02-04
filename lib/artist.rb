class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name 

  @@all = [] #all saved instances of Artists

  def initialize (name)
    @name = name 
    @songs = [] #an Artist has many songs 
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
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

  def add_song(song) #Adds a song to an artist. 
    if (song.artist == "")
      song.artist = self 
    end

    if !(@songs.include?(song)) #refers to Artist @songs here
      @songs << song #song passed
    end
  end

  def songs
    @songs
  end

  def genres  #genre themesleves do not have artists it only thru the songs that they relate (has many thru method)
    @songs.collect{|song| song.genre}.uniq
  end

end