require 'byebug'


# O(n^2)
def windowed_max_range(arr, window_size)
  biggest_max = 0

  arr.take(arr.length - window_size + 1).each_index do |index|
    window = arr.drop(index).take(window_size)
    temp_max = window.max - window.min
    biggest_max = temp_max if temp_max > biggest_max
  end
  biggest_max
end




# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
