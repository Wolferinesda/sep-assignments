require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head.nil?
      self.add_to_front(node)
      self.tail = node
    else
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head == self.tail
      self.head = nil
      self.tail = nil
    else
      temp_node = self.head
      while temp_node.next
        prev_node = temp_node
        temp_node = temp_node.next
      end
      self.tail = prev_node
    end
  end

  # This method prints out a representation of the list.
  def print
    node = self.head
    while node
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail
      remove_tail
    elsif
      node == @head
      @head = @head.next
    end

    if
      current_node = @head
      while current_node != nil && current_node.next != nil && current_node.next != node
        current_node = current_node.next
      end
      if current_node != nil && current_node.next != nil
        current_node.next = current_node.next.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head
      node.next = self.head
    end
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp_node = self.head
    self.head = temp_node.next
    temp_node
  end

  def find_node(num)
    count = 1
    current = self.head
    while current != nil
      if count == num
        return current.data
      else
        current = current.next
        count +=1
      end
    end
  end
end
