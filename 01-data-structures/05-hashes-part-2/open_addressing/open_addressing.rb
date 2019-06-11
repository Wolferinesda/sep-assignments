require_relative 'node'

class OpenAddressing
  attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
    @total_nodes = 0
  end

  def []=(key, value)
    i = index(key, size)
    new_node = Node.new(key, value)

    if @items[i].nil?
      @items[i] = new_node
    elsif @items[i].key != key
      self.resize
      return self[key] = value
    elsif @items[i].key == key && @items[i].value != value
      new_index = next_open_index(i)
      if new_index == -1
        puts "array full resizing"
        self.resize
        return self[key] = value
      else
        @items[new_index] = new_node
      end
    end
    @total_nodes += 1
    puts i
  end

  def [](key)
    i = index(key, self.size)

    if !@items[i].nil? && @items[i].key == key
      @items[i].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  def load_factor
    @total_nodes.to_f/ self.size.to_f
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < @items.length
      if @items[index].nil?
        return index
      else
        index += 1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    temp_array = @items
    @items = Array.new(self.size * 2)
    @total_nodes = 0

    temp_array.each do |item|
      if item != nil
        self[item.key] = item.value
        puts item
      end
    end
  end

  #Prints out the items' index, key, and value plus the total number of nodes plays the load factor
  def print_info
    @items.each_with_index do |item, index|
      if !item.nil?
        puts "Hash Index: " + index.to_s
        puts "Key: " + item.key + ", " + "Value: " + item.value
      end
    end
    puts "Total_Nodes: " + @total_nodes.to_s
    puts "Load_Factor: " + self.load_factor.to_s
  end
end
