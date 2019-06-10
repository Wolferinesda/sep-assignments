class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, self.size)

    new_item = HashItem.new(key, value)

    if @items[i] == new_item
      return
    elsif @items[i].nil?
      @items[i] = new_item
    else
      while @items[i] != nil && @items[i].value != value do
        resize
      end
      @items[index(key, self.size)] = new_item
    end
  end


  def [](key)
    i = index(key, self.size)
    @items[i].value
  end

  def resize
    temp_array = Array.new(@items.size * 2)

    @items.each do |item|
      if item != nil
        i = index(item.key, temp_array.size)
        temp_array[i] = HashItem.new(item.key, item.value)
      end
    end
    @items = temp_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end
