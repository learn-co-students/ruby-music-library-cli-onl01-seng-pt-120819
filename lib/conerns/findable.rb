module Concerns::Findable

  def find_by_name(song_name)
    all.find {|song|song.name == song_name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
