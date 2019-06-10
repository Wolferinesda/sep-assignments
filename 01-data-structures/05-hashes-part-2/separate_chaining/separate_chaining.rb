require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @total_nodes = 0
  end

  def []=(key, value)
    i = index(key, self.size)
    new_node = Node.new(key, value)

    if @items[i].nil?
      @items[i] = LinkedList.new
    end

    @items[i].add_to_tail(new_node)
    @total_nodes += 1

    if self.load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, self.size)
    @head = @items[i].head

    until @head.nil?
        return @head.value if @head.key == key
        @head = @head.next
    end
    return
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @total_nodes.to_f/ self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    temp_array = Array.new(@items.size * 2)

    @items.each do |item|
      if !item.nil?
        i = index(item.head.key, temp_array.size)

        temp_array[i] = LinkedList.new if temp_array[i].nil?

        current_item = item.head

        while current_item
          temp_array[i].add_to_tail(current_item)
          current_item = current_item.next
        end
      end
      @items = temp_array
    end
  end

  def print
    @items.each_with_index do |list, index|
      if !list.nil?
        puts "Hash Index: " + index.to_s
        list.print
      end
    end
    puts "Total_Nodes: " + @total_nodes.to_s
    puts "Load_Factor: " + self.load_factor.to_s
  end
end
