require 'spec_helper'

describe BinaryTreeNode do
  let(:tree_node) { BinaryTreeNode.new(0, 0) }
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
  it 'responds to #leftmost_branch' do
    expect(tree_node).to respond_to :leftmost_branch
  end
  it 'responds to #rightmost_branch' do
    expect(tree_node).to respond_to :rightmost_branch
  end

  context '#add_child' do
    it 'appends a greater value as its right child' do
      tree_node.add_child(1)
      expect(tree_node.right_child.value).to eql 1
    end
    it 'appends a lower or equal value as its left child' do
      tree_node.add_child(-1)
      expect(tree_node.left_child.value).to eql(-1)
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
        expect(tree_node.left_child.left_child.value).to eql(-2)
      end
    end
  end

  context '#leftmost_branch and #rightmost_branch' do
    let(:leftmost_branch) do
      [populated_tree,
       populated_tree.left_child,
       populated_tree.left_child.left_child,
       populated_tree.left_child.left_child.left_child]
    end

    let(:rightmost_branch) do
      [populated_tree,
       populated_tree.right_child,
       populated_tree.right_child.right_child,
       populated_tree.right_child.right_child.right_child]
    end

    it 'returns rightmost branch' do
      expect(populated_tree.rightmost_branch).to eql rightmost_branch
    end

    it 'returns leftmost branch' do
      expect(populated_tree.leftmost_branch).to eql leftmost_branch
    end
  end

  context '#preorder' do
    let(:preorder_ordered_values) { [0, -1, -2, -3, 1, 2, 3] }

    it 'executes a block on each node' do
      value = 0
      populated_tree.preorder { |node| value += node.value }
      expect(value).to be 0
    end

    it 'traverses the tree in a preorder way' do
      values = []
      populated_tree.preorder { |node| values << node.value }
      expect(values).to be_eql preorder_ordered_values
    end
  end
end
