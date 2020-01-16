class MusicImporter

    attr_reader :path

    def initialize(path)
        @path = path 
    end

    def files
        @files ||= Dir.glob("#{self.path}/*.mp3").collect{ |f| f.gsub("#{self.path}/", "") }
    end

    def import
        self.files.each{ |filename| Song.create_from_filename(filename) }
    end

end