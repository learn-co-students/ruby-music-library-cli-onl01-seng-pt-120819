#"joining" model between Artist & Genre classes
class Song
  
  extend Concerns::Findable
  
  attr_accessor :name #:artist, :genre should I add artist and genre here since the setters are not necc invoked NO

  attr_reader :artist, :genre  #both writers needed to be customized 

  @@all = [] #holds instances of Songs

  def initialize (name, artist = "", genre = "")
    @name = name 
    @artist = artist #relationship between S & A. songs belong to an artist has many songs.
    @genre = genre #Songs have one genre.Songs can be initialized with an optional genre argument.

    # def artist=(artist)    
    if !(artist == "" || artist == nil)
      self.artist=(artist)
    end
    
    # def genre=(genre)
    if !(genre == "" || genre == nil)
      self.genre=(genre)
    end
  end


  def self.create(name) #why is this a class method? 
    song = self.new(name) #self within a class method refers to the class itself. This method initalizes saves, and returns the song. 
    song.save
    song
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

  def artist=(artist) #customized writer method with added functions since initalize is NOT necessarily a writer method. Assigns the current artist to the song's 'artist' property (song belongs to artist) 
    @artist = artist 
    artist.add_song(self)
  end

  def genre=(genre) 
    @genre = genre 
    genre.add_song(self)
  end
#genre setter -- to obey the single source of truth, were going to tell this class to know all the details of each song instance -- including artist and genre
##assigns a genre to the song (song belongs to genre). genre= adds the song to the genre's collection of songs (genre has many songs)
#hey song be a nice song, when you get a new genre assign yourself to the that genre's songs
#last defintion always takes precedence! genre is an instance of genre
#genres have a property called songs ([])
#assign that genre yourself 


  def self.new_from_filename(file)
    
    song = self.find_by_name(file.split(" - ")[1])
    
    if song != nil
      song
    else 
      name = file.split(" - ")[1]
      artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      genre = Genre.find_or_create_by_name(file.split(" - ")[2].split(".")[0])
  
      self.new(name, artist, genre)
    end
  end    
    
  
  def self.create_from_filename(file)
    x = self.new_from_filename(file)
    @@all << x 
  end
  
end