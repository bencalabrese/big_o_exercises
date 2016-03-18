class Stack

  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    el, amount_over_max, amount_under_min = @store.pop

    @min += amount_under_min if amount_under_min
    @max -= amount_over_max if amount_over_max

    @max = nil if empty?
    @min = nil if empty?

    el
  end

  def push(el)
    @min ||= el
    @max ||= el

    amount_over_max = nil
    amount_under_min = nil

    if el > max
      amount_over_max = el - max
      @max = el
    end

    if el < min
      amount_under_min = min - el
      @min = el
    end

    @store.push([el, amount_over_max, amount_under_min])
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
