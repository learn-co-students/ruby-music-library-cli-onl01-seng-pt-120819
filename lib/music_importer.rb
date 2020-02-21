class MusicImporter
    
    attr_accessor :path

    @@all = []

    def initialize(path)
        @path = path
    end

    def files
        @all ||= Dir.glob("#{@path}/*.mp3").collect{ |mp3| mp3.gsub("#{@path}/", "") }
    end

    def import
        files.each do |filename|
            Song.create_from_filename(filename)
        end
    end
    # binding.pry
end