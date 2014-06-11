require 'spec_helper'

describe BinaryTreeNode do
  let(:tree_node) { BinaryTreeNode.new(0, 0) }

  it 'responds to #add_child' do
    expect(tree_node).to respond_to :add_child
  end
  it 'responds to #left_child' do
    expect(tree_node).to respond_to :left_child
  end
  it 'responds to #right_child' do
    expect(tree_node).to respond_to :right_child
  end
  it 'responds to #value' do
    expect(tree_node).to respond_to :value
  end
  it 'responds to #leftmost_children' do
    expect(tree_node).to respond_to :leftmost_children
  end
  it 'responds to #rightmost_children' do
    expect(tree_node).to respond_to :rightmost_children
  end

  context '#add_child' do
    it 'appends a greater value as its right child' do
      tree_node.add_child(1)
      expect(tree_node.right_child.value).to eql 1
    end
    it 'appends a lower or equal value as its left child' do
      tree_node.add_child(-1)
      expect(tree_node.left_child.value).to eql -1
    end

    context 'when it already has a right child' do
      it 'sends a new value to its right child to be appended' do
        tree_node.add_child(1)
        tree_node.add_child(2)
        expect(tree_node.right_child.right_child.value).to eql 2
      end
    end

    context 'when it already has a left child' do
      it 'sends a new value to its left child to be appended' do
        tree_node.add_child(-1)
        tree_node.add_child(-2)
        expect(tree_node.left_child.left_child.value).to eql -2
      end
    end
  end

  context '#leftmost_children and #rightmost_children' do
    let(:populated_tree) do
      populated_tree = BinaryTreeNode.new(0, 0)
      populated_tree.add_child(-1)
      populated_tree.add_child(-2)
      populated_tree.add_child(-3)
      populated_tree.add_child(1)
      populated_tree.add_child(2)
      populated_tree.add_child(3)
      populated_tree
    end

    let(:leftmost_nodes) do
      [populated_tree.left_child,
       populated_tree.left_child.left_child,
       populated_tree.left_child.left_child.left_child]
    end

    let(:rightmost_nodes) do
      [populated_tree.right_child,
       populated_tree.right_child.right_child,
       populated_tree.right_child.right_child.right_child]
    end

    it 'returns rightmost nodes in its right branch (no left traversing)' do
      expect(populated_tree.rightmost_children).to eql rightmost_nodes
    end

    it 'returns leftmost nodes in its left branch (no right traversing)' do
      expect(populated_tree.leftmost_children).to eql leftmost_nodes
    end
  end
end
