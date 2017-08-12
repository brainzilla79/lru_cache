class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @sentinel_head = Node.new
    @sentinel_tail = Node.new
    @sentinel_head.next = @sentinel_tail
    @sentinel_tail.prev = @sentinel_head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @sentinel_head.next
  end

  def last
    @sentinel_tail.prev
  end

  def empty?
    @sentinel_head.next == @sentinel_tail && @sentinel_tail.prev == @sentinel_head
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    each do |node|
      return true if node.key = key
    end
    false
  end

  def append(key, val)

    new_node = Node.new(key, val)
    @sentinel_tail.prev.next = new_node #takes previous tail and gives it new node as child
    new_node.prev = @sentinel_tail.prev #sets new node parent to previous tail
    @sentinel_tail.prev = new_node
    new_node.next = @sentinel_tail
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
  
        node.next.prev = node.prev
        node.prev.next = node.next
        # node.next = nil
        # node.prev = nil
      end
    end
  end

  def each
    node = @sentinel_head.next
    until node == @sentinel_tail
      yield(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
