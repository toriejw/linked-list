# Public:
#
# Examples
#

class Node
  attr_accessor :next_node
  attr_reader :data

  def initialize(data)
    @data = data
    @next_node = nil
  end

  def add_link(node)
    @next_node = node
  end

  def remove_link
    @next_node = nil
  end

end

# node1 = Node.new('2')
# node2 = Node.new('3')
# node2.add_link(node1)
# node2.next_node
