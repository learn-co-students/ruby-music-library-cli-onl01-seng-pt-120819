class Song
   
@@all = []

attr_accessor :name

def initialize(name)
@name = name
@artist = artist
@genre = genre
save
end

def save
@@all << self
end

def self.all
@@all
end

def self.destroy_all
self.all.clear
end

def self.create
self.new.save
end

def self.new_by_filename(file)
    song_parts = file.split(" - ")
    artist = song_parts[0]
    song_name = song_parts[1]
    new_song = Song.new(song_name)
    new_song.artist_name = artist
    new_song
  end
  
  def self.create_from_filename(file)
    @@all << self.new_by_filename.save(file)
end
  
 
end

# def self.find_by_name(name)
 # @@all.detect { |s| s.name == name }
# end
  

#    def self.find_or_create_by_name(name)
  #  self.find(name) ? self.find(name) : self.create(name)
 #    end
 
 # def self.create(name)
 #  self.new(name).tap {|song| song.save}
 # end




#def self.create(name)
 #   song = self.new(name)
   # song
  # end  



 # def files
  #  Dir.entries(@path).grep(/.mp3/)
    # alternate way
    # @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  # end  
  # def import
  # self.files.each{|file| Song.new_by_filename(file)}
  # end   
#end  

#the files in the directory we are looking at is being passed in #through @path and .grep method helps filter out the .mp3 part.
#We then use this files method inside of the import method to send #these files to the Song class via the Song.new_by_filename 
