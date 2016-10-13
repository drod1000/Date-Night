require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_reader :root

  def insert(score, title)
    if root
      place_node(root, score, title)
    else
      @root = Node.new(score, title)
      return 0
    end
  end
  
  def place_node(root, score, title)
    ##Must account for == case
    depth = 1
      if search(score)

      elsif score < root.score
        if root.left_child
          depth += 1
          place_node(root.left_child, score, title)
        else
          root.left_child = Node.new(score, title)
        end
      else
        if root.right_child
          depth +=1
          place_node(root.right_child, score, title)
        else
          root.right_child = Node.new(score, title)
        end
      end
    return depth
  end
  
  def include?(score)
    match = search(score)
    if match
      return true
    else
      return false
    end
  end
  
  def search(score)
    current = root
    until current == nil || current.score == score
      if score < current.score
        current = current.left_child
      else
        current = current.right_child
      end
     end
    return current 
  end
  
  def depth_of(score)
    current = root
    depth = 0
    if search(score)
      until current.score == score
        if score < current.score
          depth += 1
          current = current.left_child
        else
          depth +=1
          current = current.right_child
        end
      end
    else
      return nil
    end
    return depth

  end

  def max
    highest = root
    until highest.right_child == nil
      highest = highest.right_child
    end
    max = {highest.title => highest.score}
    return max
  end

  def min
    lowest = root
    until lowest.left_child == nil
      lowest = lowest.left_child
    end
    min = {lowest.title => lowest.score}
    return min
  end

  def sort(node,array)
    if node.left_child
      sort(node.left_child,array) 
    end
    hash = {node.title => node.score}
    array << hash
    if node.right_child
      sort(node.right_child,array)
    end
   return array
   end

  def load
    file = File.new('movies.txt', 'r')
    split_file = file.map do |line|
      line.split(',', 2)
    end

    split_file_array = split_file.to_a
    split_file_array.pop
    scores = split_file_array.collect do |index|
      index[0]
    end
    titles = split_file_array.collect do |index|
      index[1]
    end
    int_scores = scores.map do |number|
      number.to_i
    end
    clean_titles = titles.map do |title|
      title.chomp
    end
    counter = 0
    99.times do |index|
      insert(int_scores[index], clean_titles[index])
    end
end

end

