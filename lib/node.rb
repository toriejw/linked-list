# Public:
#
# Examples
#

class Node
  attr_accessor :next_node  # => nil
  attr_reader :data         # => nil

  def initialize(data)
    @data = data        # => "2", "3"
    @next_node = nil    # => nil, nil
  end                   # => :initialize

  def add_link(node)
    self.next_node = node  # => #<Node:0x007fd7f9a1d5a0 @data="2", @next_node=nil>
  end                      # => :add_link

  def remove_link
    @next_node = nil
  end                 # => :remove_link

  def tail?
    self.next_node.nil?
  end                    # => :tail?

end  # => :tail?

# node1 = Node.new('2')  # => #<Node:0x007fd7f9a1d5a0 @data="2", @next_node=nil>
# node2 = Node.new('3')  # => #<Node:0x007fd7f9a1cf60 @data="3", @next_node=nil>
# node2.next_node        # => nil
# node2.add_link(node1)  # => #<Node:0x007fd7f9a1d5a0 @data="2", @next_node=nil>
# node2.next_node        # => #<Node:0x007fd7f9a1d5a0 @data="2", @next_node=nil>
