require_relative 'binary_search_tree'
require_relative 'node'
require 'rubygems'

=begin
file = File.new('movies.txt', 'r')
file.each do |line|
    puts line.split(',' ,  2)
end
=end

tree = BinarySearchTree.new
tree.insert(61, "Bill & Ted's Excellent Adventure")
tree.insert(16, "Johnny English")
tree.insert(92, "Sharknado 3")
tree.insert(50, "Hannibal Buress: Animal Furnace")

p tree.include?(16)
p tree.include?(65)

tree.max
tree.min

tree.depth_of(85)
tree.depth_of(16)
tree.depth_of(50)

tree.sort(tree.root,[])
