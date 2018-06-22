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
