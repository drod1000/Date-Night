require 'minitest/autorun'
require 'minitest/pride'
require_relative 'date_night'

class DateNightTest < Minitest::Test
    def it_can_insert_root
      tree = BinarySearchTree.new
      tree.insert(61, "Bill & Ted's Excellent Adventure")
      assert_equal tree.root.empty? == false
    end
end