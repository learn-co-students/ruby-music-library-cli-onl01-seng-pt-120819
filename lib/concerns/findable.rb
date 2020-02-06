module Concerns::Findable
  # Module code here

def find_by_name(name)
 if self.all.find{|element| element.name == name}
   return self.all.find{|element| element.name == name}
 end
end

def  find_or_create_by_name(name)
   if self.find_by_name(name)
     return self.find_by_name(name)
   else
     self.create(name)
   end
 end

end
