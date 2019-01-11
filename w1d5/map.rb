require "byebug"

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(k, v)
    # byebug
    if self.map.any? { |key, value| key == k }
      i = self.map.index { |key, value| key == k }
      self.map[i] = [k, v]
    else
      self.map << [k, v]
    end
  end

  def show(k)
    self.map.select { |key, value| key == k }
  end

  def delete(k)
    i = self.map.index { |key, value| key == k }
    self.map.delete_at(i)
  end

  def inspect
    self.map
  end
end
