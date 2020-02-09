class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
def path
 @path ||=  Dir.glob("#{path}/*.mp3").collect do |file|
    file.gsub("#{path}/",'')
end 
end
 def files 
  @files ||=  Dir.glob("#{path}/*.mp3").collect do |file|
    file.gsub("#{path}/",'')
  end
end 
  def import
  files.each{ |filename| Song.create_from_filename(filename) }
  end 
end 