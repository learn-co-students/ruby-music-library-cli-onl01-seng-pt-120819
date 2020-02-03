class Song

  @@all = []

  attr_accessor :name, :genre
  attr_writer :artist


  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    @genre = genre
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

  def artist
    @artist
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      if !@genre.songs.include?(self)
        @genre.songs << self
      end
    end
  end

  def self.find_by_name(name)
   if @@all.find{|song| song.name == name}
     return @@all.find{|song| song.name == name}
   end
 end

 def  self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    self.new(song, artist, genre)

  end

  
end
