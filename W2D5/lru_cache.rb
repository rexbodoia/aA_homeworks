class LRUCache
  attr_reader :max_length, :elements
  def initialize(max_length)
    @elements = []
    @max_length = max_length
  end

  def count
    elements.count
  end

  def add(el)
    if elements.include?(el)
      elements.delete(el)
    elsif count == max_length
      elements.shift
    end
    elements << el
  end

  def show
    p elements
    nil
  end
end
