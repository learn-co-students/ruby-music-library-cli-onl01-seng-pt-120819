class Genre

  extend Concerns::Findable
  
  attr_accessor :name

  @@all = [] #all instances of Genres

  def initialize (name)
    @name = name
    @songs = [] #Genres have many songs and are initialized with an empty list of songs.
  end

  def self.create(name) ## Genre .create initializes and saves the genre / genre could be "x"
    genre = self.new(name)
    genre.save
    genre
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

  def songs #returns the genre's 'songs' collection (genre has many songs)
    @songs
  end

  def add_song(song) #Adds a song to a genre. DO I NEED THIS?
    if (song.genre == "")
      song.genre = self 
    end

    if !(@songs.include?(song)) #refers to Genre @songs here
      @songs << song #song passed
    end
  end

  def artists  #genre themesleves do not have artists it only thru the songs that they relate (has many thru)
    @songs.collect{|song| song.artist}.uniq
  end

end