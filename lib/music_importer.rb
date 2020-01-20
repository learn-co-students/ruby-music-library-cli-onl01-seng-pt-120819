class MusicImporter
  attr_reader :path

  @@files = []
  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|file| file.gsub("#{path}/", "")} # How does this work? How else can it be written?
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end

  
end
