class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store[key.hash % num_buckets].include?(key.hash)
      @store[key.hash % num_buckets] << key.hash  
      @count += 1
      if @count >= num_buckets
        resize!
      end
    end
  end

  def include?(key)
    return true if @store[key.hash % num_buckets].include?(key.hash)
    return false
  end

  def remove(key)
    if @store[key.hash % num_buckets].include?(key.hash)
      @store[key.hash % num_buckets].delete(key.hash) 
      @count -= 1
    end
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  #   self.store[num % num_buckets]
  # end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end
end

