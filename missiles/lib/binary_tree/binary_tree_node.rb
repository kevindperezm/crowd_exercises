class BinaryTreeNode
  attr_accessor :position, :value, :left_child, :right_child, :children_count

  def initialize(position, value)
    @value = value
    @position = position
    @left_child = @right_child = nil
  end

  def add_child(child_value)
    @children_count ||= @position
    @children_count += 1
    if child_value > @value
      @right_child.nil? \
      ? @right_child = BinaryTreeNode.new(@children_count, child_value) \
      : @right_child.add_child(child_value)
    else
      @left_child.nil? \
      ? @left_child = BinaryTreeNode.new(@children_count, child_value) \
      : @left_child.add_child(child_value)
    end
  end

  def leftmost_children
    children = []
    unless @left_child.nil?
      children << @left_child
      children += @left_child.leftmost_children
    end
    children
  end

  def rightmost_children
    children = []
    unless @right_child.nil?
      children << @right_child
      children += @right_child.rightmost_children
    end
    children
  end
end
