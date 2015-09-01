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
    # return true or false

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

list.nodes

list.append(node)

list.head

list.append(node2)

list.head
