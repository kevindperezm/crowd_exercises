require 'forwardable'
require_relative 'binary_tree_node'

# Custom implementation of a binary tree
class BinaryTree
  extend Forwardable
  attr_accessor :root, :node_count

  def initialize(value)
    @root = BinaryTreeNode.new(1, value)
    @node_count = 1
  end

  def add_child(child_value)
    @node_count += 1
    @root.add_child(@node_count, child_value)
  end

  def_delegators :@root,
                 :value,
                 :positon,
                 :left_child,
                 :right_child,
                 :leftmost_branch,
                 :rightmost_branch,
                 :preorder
end
