module Concerns::Findable
#NO self
  def find_by_name(name) 
    self.all.find{|song| 
      song.name == name
    } 
  end
  
  def find_or_create_by_name(name)
    if !(find_by_name(name))
      create(name)
    else
      find_by_name(name) 
    end
  end
  
end


