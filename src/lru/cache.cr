module Lru
  class Cache(K, V)

    def initialize(@size : Int32)
      @store = Hash(K, V).new
    end

    def [](key)
      if value = @store.delete(key)
        @store[key] = value
      end
    end

    def []=(key, val)
      @store.delete(key)
      @store[key] = val
      @store.shift if @store.size > @size
      val
    end
  end
end
