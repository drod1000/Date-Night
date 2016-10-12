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

  def test_it_can_insert_once
    tree = BinarySearchTree.new
    tree.insert("Some Movie", 20)
    assert tree.root
  end  
  
  def test_it_can_find_max
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    
    hash = {"Animals United"=>98}
    assert_equal hash, tree.max
  end

  def test_it_can_fin_min
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    hash = {"Bill & Ted's Bogus Journey"=>36}
    assert_equal hash, tree.min
  end

end