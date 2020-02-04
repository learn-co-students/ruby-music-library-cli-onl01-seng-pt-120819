require 'pry'

class Song

  extend Concerns::Findable

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


  def self.new_from_filename(filename)

    new_arr = filename.split(" - ")
    artist = Artist.find_or_create_by_name(new_arr[0])
    song = new_arr[1]
    genre = Genre.find_or_create_by_name(new_arr[2].delete(".mp3"))

    new_song = self.new(song, artist, genre)
    new_song
  end

  def self.create_from_filename(filename)
      self.new_from_filename(filename).save
  end
end
