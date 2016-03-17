
# time complexity: O(n^2)
def my_min1(list)
  list.each_with_index do |el1, i1|
    is_min = true

    list.each_with_index do |el2, i2|
      if el1 > el2
        is_min = false
        break
      end
    end

    return el1 if is_min
  end
end

# time complexity: O(n)
def my_min2(list)

  lowest = list.first
  list.each do |el|
    lowest = el if el < lowest
  end
  lowest
end

# time complexity
def largest_contiguous_subsum1(list)
  subs =[]

  list.count.times do |i|
    arr = list.drop(i)
    arr.count.times do |j|
      subs << arr.take(j + 1)
    end
  end

  max = subs.first.reduce(:+)

  subs.each do |sub|
    max = sub.reduce(:+) if sub.reduce(:+) > max
  end

  max
end

# time complexity O(n)
def largest_contiguous_subsum2(list)
  running_total = best_possible_answer = 0

  list.each do |el|
    running_total += el

    running_total = 0 if running_total < 0

    if running_total > best_possible_answer
      best_possible_answer = running_total
    end

  end

  best_possible_answer
end

# p largest_contiguous_subsum2([4, -1, -1, -1, 20]) #21
# list1 = [-14, 6, 3, -7, 4, 4, -8, -10]
# list2 = [1, 1, 1, -5, 4, 2]
# p  largest_contiguous_subsum2(list1) # => 10
# p  largest_contiguous_subsum2(list2) # => 6
