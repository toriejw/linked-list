require_relative '../lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new('10')
    @second_node = Node.new('15')
  end

  def test_can_link_to_other_nodes
    @node.add_link(@second_node)
    assert_equal @second_node, @node.next_node
  end

  def test_can_remove_link_to_node
    @node.add_link(@second_node)
    assert_equal nil, @node.remove_link
  end

  def test_next_node_defaults_to_nil
    assert_equal nil, @node.next_node
  end

end
