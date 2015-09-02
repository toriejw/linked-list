require_relative '../lib/node'
require_relative '../lib/list'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new('10')
    @second_node = Node.new('15')
    @list = List.new
    @list.append(@node)
  end

  def test_has_a_next_node_that_defaults_to_nil
    assert_equal nil, @node.next_node
  end

  def test_can_link_to_other_nodes
    @node.add_link(@second_node)
    assert_equal @second_node, @node.next_node
  end

  def test_can_remove_link_to_node
    @node.add_link(@second_node)
    @node.remove_link
    assert_equal nil, @node.next_node
  end

  def test_knows_if_its_the_tail
    @list.append(@second_node)
    assert @second_node.tail?
    refute @node.tail?
  end

end
