class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash #maybe should have used XOR
    self.map.with_index do |el, idx|
      el.hash * idx
    end.reduce(:+).hash
  end


end

class String
  def hash
    self.chars.map.with_index do |el, idx|
      el.ord * idx
    end.reduce(:+).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end
