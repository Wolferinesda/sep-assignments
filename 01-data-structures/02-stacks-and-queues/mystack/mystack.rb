class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(element)
    @stack << element
    self.top = @stack.last
  end

  def pop
    temp = @stack.last
    @stack.delete_at(stack.length - 1)
    self.top = @stack.last
    temp
  end

  def empty?
    if (@stack == [] || @stack.length === 0)
      true
    else
      false
    end
  end
end
