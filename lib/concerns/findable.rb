module Concerns::Findable
  
  def find_by_name(name)
  @@all.detect { |s| s.name == name }
 end
 
 def find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
 end
 
 def create(name)
   self.new(name).save
 end
 
 
end