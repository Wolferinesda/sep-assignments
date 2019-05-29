class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    @queue.shift
    @queue.head = @queue.first
    @queue.tail = @queue.last
  end

  def empty?
    if (@queue == [] || @queue.length === 0)
      true
    else
      false
    end
  end
end
