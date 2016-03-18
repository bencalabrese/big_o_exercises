require_relative 'my_stack'

class StackQueue
  def initialize
    @active_queue = Stack.new
    @holding_queue = Stack.new
  end

  def enqueue(el)
    @active_queue.size.times do
      @holding_queue.push(@active_queue.pop)
    end

    @holding_queue.push(el)

    @holding_queue.size.times do
      @active_queue.push(@holding_queue.pop)
    end
  end

  def dequeue
    @active_queue.pop
  end

  def size
    @active_queue.size
  end

  def min
    @active_queue.min
  end

  def max
    @active_queue.max
  end

  def empty?
    @active_queue.empty?
  end

end
