# Public:
#
# Examples
#

require_relative './node'  # => true

class List
  attr_accessor :head, :nodes  # => nil
  attr_writer :tail            # => nil

  def initialize
    @head = nil   # => nil
    @tail = nil   # => nil
  end             # => :initialize

  def tail
    node = head
    loop do

    end
  end    # => :tail

  def each_value
    yield head.data                # => nil, "3"
    node = head.next_node          # => #<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>, #<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>
    return if head.next_node.nil?  # => false, false

    loop do
      yield node.data                 # => nil, nil, "1", "2"
      break if node.next_node == nil  # => false, true, false, true
      node = node.next_node           # => #<Node:0x007f96f3026908 @data="2", @next_node=nil>, #<Node:0x007f96f3026908 @data="2", @next_node=nil>
    end                               # => nil, nil
  end                                 # => :each_value

  def each_next
    yield head.next_node
    node = head.next_node
    return if head.next_node.nil?

    loop do
      yield node.data
      break if node.next_node == nil
      node = node.next_node
    end
  end                                 # => :each_next

  def has_next_node?(node)
    node.next_node
  end                       # => :has_next_node?

  def append(node)
    if !head                                 # => true, false
      self.head = node                           # => #<Node:0x007f96f3026c00 @data="1", @next_node=nil>
    else
      existing_node = head                       # => #<Node:0x007f96f3026c00 @data="1", @next_node=nil>
      until existing_node.tail?                  # => true
        existing_node = existing_node.next_node
      end                                        # => nil
      existing_node.next_node = node             # => #<Node:0x007f96f3026908 @data="2", @next_node=nil>
    end                                          # => #<Node:0x007f96f3026c00 @data="1", @next_node=nil>, #<Node:0x007f96f3026908 @data="2", @next_node=nil>
  end                                            # => :append

  def prepend(node)
    node.add_link(head) if head  # => #<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>
    self.head = node             # => #<Node:0x007f96f3026638 @data="3", @next_node=#<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>>
  end                            # => :prepend

  def insert(node, index)

    # update head and tail
  end  # => :insert

  def includes?(value)
    return false unless head             # => #<Node:0x007f96f3026638 @data="3", @next_node=#<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>>
    each_value do |node_data|
      return true if node_data == value  # => false, false, false
    end                                  # => nil
    false                                # => false
  end                                    # => :includes?

  def pop
    # update tail

  end  # => :pop

  def count

  end  # => :count

  def find_by_index

  end  # => :find_by_index

  def find_by_value

  end  # => :find_by_value

  def remove_by_index

    # update head and tail
  end  # => :remove_by_index

  def remove_by_value
    # updated head and tail

  end  # => :remove_by_value

end  # => :remove_by_value

list = List.new        # => #<List:0x007f96f30272b8 @head=nil, @tail=nil>
node = Node.new('1')   # => #<Node:0x007f96f3026c00 @data="1", @next_node=nil>
node2 = Node.new('2')  # => #<Node:0x007f96f3026908 @data="2", @next_node=nil>
node3 = Node.new('3')  # => #<Node:0x007f96f3026638 @data="3", @next_node=nil>

list.append(node)    # => #<Node:0x007f96f3026c00 @data="1", @next_node=nil>
list.append(node2)   # => #<Node:0x007f96f3026908 @data="2", @next_node=nil>
list.prepend(node3)  # => #<Node:0x007f96f3026638 @data="3", @next_node=#<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>>

list.includes?('hi')  # => false

list.each_value do |data|  # => #<List:0x007f96f30272b8 @head=#<Node:0x007f96f3026638 @data="3", @next_node=#<Node:0x007f96f3026c00 @data="1", @next_node=#<Node:0x007f96f3026908 @data="2", @next_node=nil>>>, @tail=nil>
  data                     # => "3", "1", "2"
end                        # => nil
