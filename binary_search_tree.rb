require_relative 'node'

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
  def include(score)
    match = search(score)
    if match != nil
      return true
    else
      return false
    end
  end
  def search(score)
    current = @root
      until current == nil || current.score == score
        if score < current.score
          current = current.left_child
        else
          current = current.right_child
        end
     end
     return current 
  end
  #Reports the depth of the tree where a score appears. 
  #Return nil if the score does not exist
  def depth_of(score)
  end

  def max
    highest = @root
    until highest.right_child == nil
      highest = highest.right_child
    end
    return highest
  end

  def min
    lowest = @root
    until lowest.left_child == nil
      lowest = lowest.left_child
    end
    return lowest
  end
end

