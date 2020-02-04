class MusicImporter
attr_accessor :path

  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).grep(/.mp3/)
  end
  
  def import
   self.files.each{|file| Song.new_by_filename(file)}
  end   
end  
  
end