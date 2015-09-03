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

    node = head
    until node.tail?
      node = node.next_node
    end
    node
  end

  def each_value(skip_first = false)
    return nil unless head

    yield head.data unless skip_first
    node = head.next_node

    loop do
      break if node.nil?
      yield node.data
      node = node.next_node
    end
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
    if index > count + 1
      warn("Index is outside of the bounds of the list. Node not inserted.")
    elsif index == 0
      prepend(node)
    else
      node_index = 1
      previous_node = head
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
    return unless head
    existing_node = head
    until existing_node.next_node.tail?
      existing_node = existing_node.next_node
    end
    popped_node = existing_node.next_node
    existing_node.remove_link
    popped_node
  end

  def count
    values = []
    each_value { |value| values << value }
    values.size
  end

  def find_by_index(index)
    current_node = head
    0.upto(count - 1) do |current_index|
      return current_node.data if current_index == index
      current_node = current_node.next_node
    end
  end

  def find_by_value(value)
    current_index = 0
    each_value do |current_value|
      return current_index if current_value == value
      current_index += 1
    end
  end

  def remove_by_index(index)
    if index == 0
      self.head = head.next_node
    else
      previous_node = head
      1.upto(count - 1) do |current_index|
        previous_node.add_link(previous_node.next_node.next_node) if current_index == index
        previous_node = previous_node.next_node
      end
    end
  end

  def remove_by_value(value)
    self.head = head.next_node if head.data == value

    previous_node = head
    each_value(skip_first = true) do |current_value|
      previous_node.add_link(previous_node.next_node.next_node) if current_value == value
      previous_node = previous_node.next_node
    end
  end

  def distance(node1, node2)
    first_index  = nil
    second_index = nil

    current_node = head
    0.upto(count - 1) do |current_index|
      first_index  = current_index if current_node == node1
      second_index = current_index if current_node == node2
      current_node = current_node.next_node
    end

    (second_index - first_index).abs
  end
end
