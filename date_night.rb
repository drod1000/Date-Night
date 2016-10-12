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

tree.insert(98, "Animals United")
tree.insert(58, "Armageddon")
tree.insert(36, "Bill & Ted's Bogus Journey")
tree.insert(93, "Bill & Ted's Excellent Adventure")
tree.insert(86, "Charlie's Angels")
tree.insert(38, "Charlie's Country")
tree.insert(69, "Collateral Damage")

