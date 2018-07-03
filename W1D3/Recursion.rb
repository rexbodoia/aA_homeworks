def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length <= 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return true if flavors.include?(favorite)
  return false if flavors.empty?
  ice_cream_shop(flavors.drop(1), favorite)
end

def reverse(string)
  return string if string.length == 1 || string == ""
  reverse(string[1..-1]) + string[0]
end
