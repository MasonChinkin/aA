require "byebug"
# def range(start,finish) #1,5
#     return [] if start == finish
#     arr = []
#     arr << start #1
#     range(start + 1,finish)
#     arr #5,5
# end
#[1,2]

def range(start, finish)
  return [] if start >= finish
  [start + 1] + range(start + 1, finish)
end

# def exp(b,n) # option 1
#     return 1 if n == 0
#     b * exp(b,n-1)
# end

def exp(b, n) # option 2
  return 1 if n == 0
  result = nil

  if n.even?
    result = exp(b, n / 2) ** 2
  else
    result = b * (exp(b, (n - 1) / 2) ** 2)
  end

  result
end

def deep_dup(arr)
  return [] if arr.length == 0
  [arr[0]] + deep_dup(arr[1..-1])
end

def fib_iterative(n)
  return [] if n < 1
  fib_results = [1, 1]
  return fib_results[0] if n == 1
  return fib_results if n == 2

  until fib_results.length == n
    fib_results << fib_results[-2] + fib_results[-1]
  end

  return fib_results
end

def fib_recursive(n)
  return [] if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2

  last_arr = fib_recursive(n - 1)
  last_arr + [(last_arr[-1] + last_arr[-2])]
end

def bsearch(arr, target)
  middle_i = arr.length / 2

  return middle_i if target == arr[middle_i]
  return nil if target != arr[middle_i] && arr.length == 1

  # debugger

  if target > arr[middle_i]
    temp = bsearch(arr[middle_i..-1], target)
    return nil if temp == nil
    middle_i + temp
  else
    bsearch(arr[0...middle_i], target)
  end
end

def merge_sort(arr)
  return [] if arr.length == 0
  return arr if arr.length == 1

  middle_i = arr.length / 2
  arr_left = arr[0...middle_i]
  arr_right = arr[middle_i..-1]

  sorted_left = merge_sort(arr_left)
  sorted_right = merge_sort(arr_right)

  result = merge(sorted_left, sorted_right)
end

def merge(left, right)
  new_arr = []

  new_arr_length = left.length + right.length
  until new_arr.length == new_arr_length
    if right.empty?
      new_arr << left.shift
      next
    end

    if left.empty?
      new_arr << right.shift
      next
    end

    if left[0] < right[0]
      new_arr << left.shift
    else
      new_arr << right.shift
    end
  end
  new_arr
end

def subsets(arr)
  # p arr

  return [[]] if arr == []

  subs = subsets(arr[0...-1])

  # debugger
  added = adder(subs, arr[-1])

  subs + added
end

def adder(arr, num)
  # debugger
  new_arr = []
  arr.each { |ele| new_arr << (ele += [num]) }
  new_arr
end

def permutations(array)
  return array if array.length == 1

  first = array.first
  rest_arr = array[1..-1]

  rest_perm = permutations(rest_arr)

  results = [array]

  inserter(results, first)

  results
end

def inserter(arr, insert)
end

if __FILE__ == $PROGRAM_NAME
  # p range(1,1) # => []
  # p range(1,2) # => [1]
  # p range(1,5) # => [1,2,3,4]
  # p range(2,4) # => [2,3]
  # p range(4,2) # => []

  #p exp(0,1) # 0
  #p exp(1,0) # 1
  #p exp(1,2) # 1
  #p exp(2,0) # 1
  #p exp(2,1) # 2
  # p exp(2,6) # 4

  # var1 = [1, [2], [3, [4]]]
  # var2 = deep_dup(var1) # copy
  # var1[2] = [9,8]
  # p var1
  # p var1.object_id

  # p var2
  # p var2.object_id

  # p bsearch([1, 2, 3], 1) # => 0
  # p bsearch([2, 3, 4, 5], 3) # => 1
  # p bsearch([2, 4, 6, 8, 10], 6) # => 2
  # p bsearch([1, 3, 4, 5, 9], 5) # => 3
  # p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
  # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
  # p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

  # p merge_sort([1,4,3,2])
  #p merge_sort([])
  #p merge_sort([1,2])

  # p subsets([]) # => [[]]
  # p subsets([1]) # => [[], [1]]
  # p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
  # p subsets([1, 2, 3])
  # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

  # p permutations([1, 2, 3])
end
