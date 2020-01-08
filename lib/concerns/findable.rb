module Concerns::Findable
    
        def find_by_name(name)
            all.detect do |a|
                a.name == name 
            end
        end
    
        def find_or_create_by_name(name)
            if all != [] 
                find_by_name(name)
            else
                new(name)
            end
        end
end
