# gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'date_night'

class DateNightTest < Minitest::Test
    def test_it_can_create_a_tree
      tree = BinarySearchTree.new
      assert tree
    end
end