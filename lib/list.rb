# Public:
#
# Examples
#

require_relative './node'

class List
  attr_accessor :head
  attr_writer :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def tail
    return nil if head.nil?
    return head if head.tail?

    node = head.next_node
    until node.tail?
      node = node.next_node
    end
    node
  end

  def each_value
    return nil if !head

    yield head.data
    node = head.next_node
    return if head.next_node.nil?

    loop do
      yield node.data
      break if node.next_node == nil
      node = node.next_node
    end
  end

  def has_next_node?(node)
    node.next_node
  end

  def append(node)
    if !head
      self.head = node
    else
      existing_node = head
      until existing_node.tail?
        existing_node = existing_node.next_node
      end
      existing_node.next_node = node
    end
  end

  def prepend(node)
    node.add_link(head) if head
    self.head = node
  end

  def insert(node, index)
    if index > self.count + 1
      warn("Index is outside of the bounds of the list. Node not inserted.")
    elsif index == 0
      self.prepend(node)
    else
      node_index = 1
      previous_node = self.head
      loop do
        if node_index == index
          node.add_link(previous_node.next_node)
          previous_node.add_link(node)
          break
        end
        node_index += 1
        previous_node = previous_node.next_node
      end
    end
  end

  def includes?(value)
    return false unless head
    each_value do |node_data|
      return true if node_data == value
    end
    false
  end

  def pop
    if head
      existing_node = head
      until existing_node.next_node.tail?
        existing_node = existing_node.next_node
      end
      popped_node = existing_node.next_node
      existing_node.remove_link
      popped_node
    end
  end

  def count
    values = []
    self.each_value { |value| values << value }
    values.size
  end

  def find_by_index(index)
    current_node = self.head
    0.upto(self.count - 1) do |current_index|
      if current_index == index
        return current_node.data
      end
      current_node = current_node.next_node
    end
  end

  def find_by_value

  end

  def remove_by_index
    # update head and tail
  end

  def remove_by_value
    # updated head and tail

  end

end

list = List.new
node = Node.new('1')
node2 = Node.new('2')
node3 = Node.new('3')

list.append(node)
list.insert(node2, 1)
list.insert(node3, 2)

list.find_by_index(1)
