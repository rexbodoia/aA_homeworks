def sluggish_octopus(array)
  result = array.first
  array.each do |fish|
    array.each do |other_fish|
      result = other_fish if other_fish.length > fish.length
    end
  end
  result
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if count <= 1
    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged += left
    merged += right
    merged
  end
end

def dominant_octopus(array)
  prc = proc { |x, y| y.length <=> x.length }
  array.merge_sort(&prc)[0]
end

def clever_octopus(array)
  biggest = array.first
  array.each do |fish|
    biggest = fish if fish.length > biggest.length
  end
  biggest
end

def slow_dance(dir, tiles)
  tiles.each_index do |idx|
    return idx if tiles[idx] == dir
  end
end

HASH = {"up" => 0, "right_up" => 1, "right" => 2, "right_down" => 3,
   "down" => 4, "left_down" => 5, "left" => 6, "left_up" => 7}
def constant_dance(dir, hash)
  hash[dir]
end
