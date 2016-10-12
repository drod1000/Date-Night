require_relative 'node'
require 'pry'

class BinarySearchTree
  attr_reader :root

  def insert(score, title)
    if root == nil
            @root = Node.new(score,title)
            return 1
        else
            place_node(root, score, title)
        end
    end
    
    def place_node(root, score, title)
    ##Must account for == case
        depth = 2
        if score < root.score
            if root.left_child == nil
                root.left_child = Node.new(score, title)
            else
                depth += 1
                place_node(root.left_child, score, title)
            end
        else
            if root.right_child == nil
                root.right_child = Node.new(score, title)
            else
                depth +=1
                place_node(root.right_child, score, title)
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
    depth = 1
    if search(score) == nil
        return nil
    else
        until current.score == score
            if score < current.score
                depth += 1
                current = current.left_child
            else
                depth +=1
                current = current.right_child
            end
        end
        return depth
    end
  end

  def max
    highest = root
    if highest.right_child
      highest = highest.right_child
    end
    return highest
  end

  def min
    lowest = root
    if lowest.left_child
      lowest = lowest.left_child
    end
    return lowest
  end
  def move_through_tree(node,array)
    if node.left_child
      move_through_tree(node.left_child,array) 
    end
    array << node.score
    if node.right_child
      move_through_tree(node.right_child,array)
    end
   return array
   end
end

