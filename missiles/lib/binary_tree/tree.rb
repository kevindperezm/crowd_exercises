require 'forwardable'
require_relative 'node'

module BinaryTree
  # Custom implementation of a binary tree
  class Tree
    extend Forwardable
    attr_reader :root

    def initialize(value)
      @root = Node.new(value)
    end

    def add_child(child_value)
      @root.add_child(child_value)
    end

    def_delegators :@root,
                   :value,
                   :left_child,
                   :right_child,
                   :leftmost_branch,
                   :rightmost_branch,
                   :preorder
  end
end
