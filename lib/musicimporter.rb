class MusicImporter 
    attr_accessor :path, :files  

    def initialize(path) #accepts a file path to parse MP3 files from
        @path = path #retrieves the path provided to the MusicImporter object
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import 
        files.each {|file| Song.create_from_filename(file)}
    end


    
end
