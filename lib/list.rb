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

  def has_next_node?(node)
    node.next_node
  end

  def append(node)
    node.add_link(head) unless !head
    self.head = node
  end

  def prepend(node)

    # update tail
  end

  def insert(node, index)

    # update head and tail
  end

  def includes?(value)
    return false if !head
    self.each_value do |node_data|
      return true if node_data == value
    end
    false
  end

  def pop
    # update tail

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
list.append(node3)

list.includes?('hi')

list.each_value do |data|
  data
end
