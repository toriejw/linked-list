require_relative '../lib/list'

class ListTest < Minitest::Test

  def setup
    @list = List.new
    @node = Node.new('1')
    @node2 = Node.new('2')
    @node3 = Node.new('3')
  end

  def test_list_has_a_tail_that_defaults_to_nil
    assert_equal nil, @list.tail
    @list.append(@node)
    @list.append(@node2)
    assert_equal @node2, @list.tail
  end

  def test_list_has_a_head_that_defaults_to_nil
    assert_equal nil, @list.head
    @list.append(@node)
    assert_equal @node, @list.head
  end

  def test_can_prepend_a_node
    @list.prepend(@node)
    assert_equal @node, @list.head
    @list.prepend(@node2)
    assert_equal @node2, @list.head
    assert_equal @node, @node2.next_node
  end

  def test_can_apppend_a_node
    @list.append(@node)
    assert @node.tail?
    @list.append(@node2)
    assert @node2.tail?
    assert_equal @node2, @node.next_node
  end

  def test_can_find_a_value_in_the_list
    @list.append(@node)
    @list.append(@node2)
    assert @list.includes?('1')
    refute @list.includes?(2)
  end

  def test_can_remove_and_return_last_node
    @list.append(@node)
    @list.append(@node2)
    returned_node = @list.pop
    assert_equal @node, @list.tail
    assert_equal @node2, returned_node
  end

  def test_can_return_size_of_list
    assert_equal 0, @list.count
    @list.append(@node)
    @list.append(@node2)
    assert_equal 2, @list.count
  end

  def test_can_return_head_value
    @list.append(@node)
    assert_equal @node.data, @list.head.data
    @list.append(@node2)
    assert_equal @node.data, @list.head.data
  end

  def test_can_return_tail_value
    @list.append(@node)
    assert_equal @node.data, @list.tail.data

    @list.append(@node2)
    assert_equal @node2.data, @list.tail.data
  end

  def test_can_insert_node_by_index
    @list.insert(@node, 0)
    assert_equal @node, @list.head

    @list.insert(@node2, 10)
    assert_equal @node, @list.head
    assert_equal @node, @list.tail

    @list.insert(@node2, 1)
    @list.insert(@node3, 1)
    assert_equal @node2, @list.tail
    assert_equal 3, @list.count
  end

end
