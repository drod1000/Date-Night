class Node
  attr_reader   :score,
                :title
  attr_accessor :left_child,
                :right_child
  def initialize(score, title)
    @score = score
    @title = title
  end
end