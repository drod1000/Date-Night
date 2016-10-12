# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'date_night'

class DateNightTest < Minitest::Test
  def test_it_can_create_a_tree
    tree = BinarySearchTree.new
    assert tree
  end

  def test_it_can_create_a_node
    node = Node.new("Some Movie", 20)
    assert node
  end

  def test_it_can_insert
    tree = BinarySearchTree.new
    tree.insert("Some Movie", 20)
    assert tree.root
  end  
end