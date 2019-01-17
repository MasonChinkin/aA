FISH = ["fish", "fiiish", "fiiiiish", "fiiiish", "fffish", "ffiiiiisshh", "fsh", "fiiiissshhhhhh"]

def sluggish(arr)
  longest = ""
  arr.each do |ele1|
    if arr.none? { |ele2| ele1 != ele2 && ele2.length > ele1.length }
      longest = ele1
    end
  end
  longest
end

def merge_sort(arr, &prc)
  return self if self.length < 2
  mid = arr.length / 2
  left = arr.take(mid).merge_sort(&prc)
  right = arr.drop(mid).merge_sort(&prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  sorted = []
  case prc.call(left[0], right[0])
  when -1
    sorted << left.shift
  when 0
    sorted << left.shift
  when 1
    sorted << right.shift
  end
  sorted + left + right
end

# calling it quits after 30 min. A lot to take in...
