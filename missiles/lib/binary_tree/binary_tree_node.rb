class BinaryTreeNode
  attr_accessor :value, :left_child, :right_child
  attr_reader :position, :children_count

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

  def leftmost_branch
    children = [self]
    children += @left_child.leftmost_branch unless @left_child.nil?
    children
  end

  def rightmost_branch
    children = [self]
    children += @right_child.rightmost_branch unless @right_child.nil?
    children
  end

  def preorder(&block)
    block.call(self)
    @left_child && @left_child.preorder(&block)
    @right_child && @right_child.preorder(&block)
  end
end
