  class LRUCache
    attr_reader :array
    def initialize(num)
      @array = Array.new
      @length = num
    end

    def count
      self.array
    end

    def add(el)
      # adds element to cache according to LRU principle
      if self.array.length == @length
       garbage = self.array.shift
      end
      if self.array.include?(el)
        self.array.delete(el)
        self.array << el
      elsif 
        self.array << el
      end
       
    end

    def show
      # shows the items in the cache, with the LRU item first
      print self.array
    end

    private
    # helper methods go here!

  end

