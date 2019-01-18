class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    self.cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if self.cache.include?(el)
      self.cache.delete(el)
      self.cache << el
    elsif count >= self.size
      self.cache.shift
      self.cache << el
    else
      self.cache << el
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p self.cache
    nil
  end

  private

  # helper methods go here!

end
