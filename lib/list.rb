# Public:
#
# Examples
#

require_relative './node'

class List
  attr_accessor :head, :nodes
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
    yield head.data
    node = head.next_node
    return if head.next_node.nil?

    loop do
      yield node.data
      break if node.next_node == nil
      node = node.next_node
    end
  end

  # def each_next
  #   yield head.next_node
  #   node = head.next_node
  #   return if head.next_node.nil?
  #
  #   loop do
  #     yield node.data
  #     break if node.next_node == nil
  #     node = node.next_node
  #   end
  # end

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

    # update head and tail
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

  end

  def find_by_index

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
list.append(node2)
list.pop
list.tail

list.tail
