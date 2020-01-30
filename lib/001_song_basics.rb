class Song

  @@all = []

  attr_accessor :name, :genre
  attr_writer :artist, :genre

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

  end
