# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/date_night'
require '../lib/binary_search_tree'

class DateNightTest < Minitest::Test
  def test_it_can_create_a_tree
    tree = BinarySearchTree.new
    assert tree
  end

  def test_it_can_create_a_node
    node = Node.new("Some Movie", 20)
    assert node
  end

  def test_it_can_insert_root
    tree = BinarySearchTree.new
    tree.insert(20, "Some Movie")
    assert tree.root
  end

  def test_it_can_insert_right
    tree = BinarySearchTree.new
    tree.insert(20, "Some Movie")
    tree.insert(25, "Another Movie")
    assert tree.root.right_child
  end
  def test_it_can_insert_left
    tree = BinarySearchTree.new
    tree.insert(25, "Another Movie")
    tree.insert(20, "Some Movie")
    assert tree.root.left_child
  end

  def test_it_can_insert_right_left
    tree = BinarySearchTree.new
    tree.insert(25, "Movie 1")
    tree.insert(30, "Movie 2")
    tree.insert(28, "Movie 3")
    assert tree.root.right_child.left_child
  end
  
  def test_it_can_insert_left_right
    tree = BinarySearchTree.new
    tree.insert(30, "Movie 1")
    tree.insert(25, "Movie 2")
    tree.insert(28, "Movie 3")
    assert tree.root.left_child.right_child
  end

  def test_it_wont_insert_if_score_is_present
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(98, "Armageddon")
    assert_equal tree.root.title, "Animals United"
  end  
  
  def test_it_can_find_score_that_is_in_tree
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert tree.include?(38)
  end

  def test_it_can_refute_score_that_is_not_in_tree
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    refute tree.include?(99)
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

  def test_it_can_find_min
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

  def test_it_can_find_depth_of_root
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert_equal 0, tree.depth_of(98)
  end

  def test_it_can_find_depth_past_root
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert_equal 2, tree.depth_of(36)
  end

  def test_it_can_sort
    tree = BinarySearchTree.new
    
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    assert_equal [{"Bill & Ted's Bogus Journey"=>36}, {"Armageddon"=>58}, {"Charlie's Angels"=>86}, {"Bill & Ted's Excellent Adventure"=>93}, {"Animals United"=>98}], tree.sort(tree.root,[])
  end
  
end