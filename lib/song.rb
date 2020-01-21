class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    self.artist = artist 
    self.genre = genre 
  end 
  
  def self.all 
    @@all 
  end 
  
   def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  
  def genre=(genre)
    if @genre == nil 
      @genre = genre 
    else 
      @genre = @genre 
    end 
    if self.genre != nil 
      @genre.add_song(self)
    end 
    @genre 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name} 
  end 
    
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
  
  def self.create_from_filename(name)
    self.all << self.new_from_filename(name)

  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
  
end 