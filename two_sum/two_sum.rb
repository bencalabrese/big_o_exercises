

# O(n^2)
def bad_two_sum?(arr, target_sum)

  arr.each_with_index do |el1, index|
    arr.drop(index + 1).each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)
  sorted = arr.sort

  sorted.each_with_index do |el, idx|
    if arr.drop(idx + 1).bsearch { |el2| target_sum - el <=> el2 }
      return true
    end
  end

  false
end


def best_two_sum?(arr, target_sum)
  hash = Hash.new(false)

  arr.each do |el|
    return true if hash[target_sum - el]
    hash[el] = true
  end

  false
end

arr = [0, 1, 5, 7]

p best_two_sum?([1, 2, 3, 4], 8) # => should be false
p best_two_sum?(arr, 6) # => should be true
p best_two_sum?(arr, 10) # => should be false
