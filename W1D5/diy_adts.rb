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

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map << [key, value] if @map.none? { |pair| pair.first == key }
  end

  def get(key)
    @map.each { |pair| return pair.last if pair.first == key }
  end

  def delete(key)
    @map = @map.reject { |pair| pair.first == key }
  end

  def show
    @map
  end
end
