class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue.unshift(el)
  end

  def dequeue
    self.queue.pop
  end

  def peek
    self.queue[-1]
  end

  def inspect
    self.queue
  end
end
