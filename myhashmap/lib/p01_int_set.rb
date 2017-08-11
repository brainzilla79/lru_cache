class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    if num <= @max && num >= 0
      if include?(num)
        raise "already there"
      else
        @store[num] = true
      end
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%num_buckets] << num
  end

  def remove(num)
    @store[num%num_buckets].delete(num)
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      @store[num % num_buckets] << num
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def remove(num)
    if @store[num % num_buckets].include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(2 * num_buckets) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end

end
