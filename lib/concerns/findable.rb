module Concerns::Findable
    
        def self.find_by_name(name)
            self.all.detect do |song|
                song.name == name 
            end
        end
    
        def self.find_or_create_by_name(name)
            if self.all != [] 
                self.find_by_name(name)
            else
                self.new(name)
            end
        end
end
