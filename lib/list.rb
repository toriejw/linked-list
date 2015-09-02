# Public:
#
# Examples
#

require_relative './node'  # => true

class List
  attr_accessor :head  # => nil
  attr_writer :tail    # => nil

  def initialize
    @head = nil   # => nil
    @tail = nil   # => nil
  end             # => :initialize

  def tail
    return nil if head.nil?
    return head if head.tail?

    node = head.next_node
    until node.tail?
      node = node.next_node
    end
    node
  end                        # => :tail

  def each_value
    return nil if !head  # => false, false, false

    yield head.data                # => ["1"], ["1"], 1
    node = head.next_node          # => nil, #<Node:0x007ff96a834238 @data="2", @next_node=nil>, #<Node:0x007ff96a834238 @data="2", @next_node=#<Node:0x007ff96a8354d0 @data="3", @next_node=nil>>
    return if head.next_node.nil?  # => true, false, false

    loop do
      yield node.data                 # => ["1", "2"]
      break if node.next_node == nil  # => true
      node = node.next_node
    end                               # => nil
  end                                 # => :each_value

  def has_next_node?(node)
    node.next_node
  end                       # => :has_next_node?

  def append(node)
    if !head                                     # => true
      self.head = node                           # => #<Node:0x007ff96a834490 @data="1", @next_node=nil>
    else
      existing_node = head
      until existing_node.tail?
        existing_node = existing_node.next_node
      end
      existing_node.next_node = node
    end                                          # => #<Node:0x007ff96a834490 @data="1", @next_node=nil>
  end                                            # => :append

  def prepend(node)
    node.add_link(head) if head
    self.head = node
  end                            # => :prepend

  def insert(node, index)
    if index > self.count + 1                                                 # => false, false
      warn("Index is outside of the bounds of the list. Node not inserted.")
    elsif index == 0                                                          # => false, false
      self.prepend(node)
    else
      node_index = 1                                                          # => 1, 1
      previous_node = self.head                                               # => #<Node:0x007ff96a834490 @data="1", @next_node=nil>, #<Node:0x007ff96a834490 @data="1", @next_node=#<Node:0x007ff96a834238 @data="2", @next_node=nil>>
      loop do
        if node_index == index                                                # => true, false, true
          node.add_link(previous_node.next_node)                              # => nil, nil
          previous_node.add_link(node)                                        # => #<Node:0x007ff96a834238 @data="2", @next_node=nil>, #<Node:0x007ff96a8354d0 @data="3", @next_node=nil>
          break
        end
        node_index += 1                                                       # => 2
        previous_node = previous_node.next_node                               # => #<Node:0x007ff96a834238 @data="2", @next_node=nil>
      end                                                                     # => nil, nil
    end                                                                       # => nil, nil
  end                                                                         # => :insert

  def includes?(value)
    return false unless head
    each_value do |node_data|
      return true if node_data == value
    end
    false
  end                                    # => :includes?

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
  end                                            # => :pop

  def count
    values = []                                  # => [], []
    self.each_value { |value| values << value }  # => nil, nil
    values.size                                  # => 1, 2
  end                                            # => :count

  def find_by_index(index)
    current_node = self.head
    0.upto(self.count - 1) do |current_index|
      if current_index == index
        return current_node.data
      end
      current_node = current_node.next_node
    end
  end                                          # => :find_by_index

  def find_by_value(value)
    current_index = 0                                 # => 0
    self.each_value do |current_value|                # => #<List:0x007ff96a834aa8 @head=#<Node:0x007ff96a834490 @data="1", @next_node=#<Node:0x007ff96a834238 @data="2", @next_node=#<Node:0x007ff96a8354d0 @data="3", @next_node=nil>>>, @tail=nil>
      return current_index if current_value == value  # => false, true
      current_index += 1                              # => 1
    end
  end                                                 # => :find_by_value

  def remove_by_index
    # update head and tail

  end  # => :remove_by_index

  def remove_by_value
    # updated head and tail

  end  # => :remove_by_value

end  # => :remove_by_value

list = List.new        # => #<List:0x007ff96a834aa8 @head=nil, @tail=nil>
node = Node.new('1')   # => #<Node:0x007ff96a834490 @data="1", @next_node=nil>
node2 = Node.new('2')  # => #<Node:0x007ff96a834238 @data="2", @next_node=nil>
node3 = Node.new('3')  # => #<Node:0x007ff96a8354d0 @data="3", @next_node=nil>

list.append(node)      # => #<Node:0x007ff96a834490 @data="1", @next_node=nil>
list.insert(node2, 1)  # => nil
list.insert(node3, 2)  # => nil

list.find_by_value('2')  # => 1
