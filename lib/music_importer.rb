class MusicImporter

    attr_reader :path

    def initialize(path)
        @path = path 
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        #converted_array = files.map { |file| file.split(" - ").join(".").split(".")[0..-2].join(" - ") }
        files.each{ |filename| Song.create_from_filename(filename) }
    end
end