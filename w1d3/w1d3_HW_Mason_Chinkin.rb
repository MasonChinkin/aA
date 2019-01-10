require "byebug"

def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return n if n <= 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(ice_creams, fav)
  return true if ice_creams[0] == fav
  return false if ice_creams.length == 0
  ice_creams.shift
  ice_cream_shop(ice_creams, fav)
end

def reverse(str)
  return str if str.length == 0
  str[-1] + reverse(str[0..-2])
end
