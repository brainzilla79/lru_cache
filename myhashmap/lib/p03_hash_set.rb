require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    self[key.hash % num_buckets] << key
    @count += 1
    resize! if count == num_buckets
  end

  def include?(key)
    self[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    self[key.hash % num_buckets].delete(key)
  end

  private

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!

    old_store = @store
    @store = Array.new(2 *  num_buckets) {Array.new}
    @count = 0
    old_store.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
