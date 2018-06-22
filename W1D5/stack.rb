class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.shift
  end

  def peek
    @stack.first
  end
end
