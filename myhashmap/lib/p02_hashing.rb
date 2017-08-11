class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.map.with_index do |el, idx|
      if el.is_a?(Integer)
        el * idx
      elsif el.is_a?(String)
        el.chars.map(&:ord).reduce(:+) * idx
      else
        5 * idx
      end
    end.reduce(:+).hash
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.hash
  end
end
