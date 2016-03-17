
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

# time complexity
def largest_contiguous_subsum2(list)
  running_total = best_possible_answer = possibly_lesser_sum = 0

  list.each do |el|
    if el + possibly_lesser_sum > 0
      running_total += (el + possibly_lesser_sum)
      possibly_lesser_sum = 0
    else
      possibly_lesser_sum += el
    end

    if running_total > best_possible_answer
      best_possible_answer = running_total
    end

    if possibly_lesser_sum + running_total < 0
      running_total = possibly_lesser_sum = 0
    end
  end

  best_possible_answer
end

# p largest_contiguous_subsum2([4, -1, -1, -1, 20])
# list1 = [-14, 6, 3, -7, 4, 4, -8, -10]
# list2 = [1, 1, 1, -5, 4, 2]
# p  largest_contiguous_subsum2(list1) # => 8
# p  largest_contiguous_subsum2(list2) # => 6
