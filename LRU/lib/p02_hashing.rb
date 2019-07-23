class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |ele, i|
      result += ele * 3
      result += self.last
    end
    result
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    result = 0
    self.downcase.split("").each_with_index do |ele, i|
      result += alphabet.index(ele) * 3
      result += alphabet.index(ele)
      result += alphabet.index(self.split("").last)
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.keys.each_with_index do |el, index|
      result += self.length * index + 4
    end
    self.values.each_with_index do |el, index|
      result += self.length * index + 4
    end
    result
  end
end
