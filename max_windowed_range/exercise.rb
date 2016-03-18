require 'byebug'
require_relative 'my_stackqueue'

# O(n^2)
def bad_windowed_max_range(arr, window_size)
  biggest_max = 0

  arr.take(arr.length - window_size + 1).each_index do |index|
    window = arr.drop(index).take(window_size)
    temp_max = window.max - window.min
    biggest_max = temp_max if temp_max > biggest_max
  end
  biggest_max
end

# O(n)
def good_windowed_max_range(arr, window_size)
  queue = StackQueue.new

  arr.take(window_size).each { |el| queue.enqueue(el) }
  biggest_max = queue.max - queue.min

  arr.drop(window_size).each do |el|
    queue.dequeue
    queue.enqueue(el)
    current_max = queue.max - queue.min
    biggest_max = current_max if current_max > biggest_max
  end

  biggest_max
end


p good_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p good_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p good_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p good_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
