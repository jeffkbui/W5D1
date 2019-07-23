class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @store.length - 1 || num < 0
      raise "Out of bounds" 
    end
    self.store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return true if @store[num] == true
    return false
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
    @store[num % 20].push(num)
  end

  def remove(num)
    @store[num % 20].delete(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
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
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num % @store.length].include?(num)
      @store[num % @store.length] << num
      @count += 1
    end
  end

  def remove(num)
    if @store[num % @store.length].include?(num)
      @store[num % @store.length].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def num_buckets
    self.store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end

  def [](num)
    self.store[num % num_buckets]
  end
end
