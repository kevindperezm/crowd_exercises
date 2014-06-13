require_relative '../binary_tree/binary_tree'

# A algorithm implmentation that builds a tree
# for each missile and find the optimal route
# among all of the possible routes.
class MultipleTreeStrategy
  def initialize(missile_data)
    @missile_data = missile_data
    @trees = []
    @destruction_routes = []
  end

  def optimal_missile_destruction_route
    missile_destruction_routes if @destruction_routes.empty?
    @destruction_routes.max_by { |route| route.length }
  end

  def missile_destruction_routes
    if @destruction_routes.empty?
      build_all_trees
      find_destruction_routes_in_trees
    end
    @destruction_routes
  end

  private

  def build_all_trees
    @missile_data.each_index do |i|
      @trees << build_tree(@missile_data.drop(i), i + 1)
    end
  end

  def find_destruction_routes_in_trees
    @trees.each do |tree|
      @destruction_routes += find_destruction_routes(tree)
    end
  end

  def build_tree(missile_altitudes, root_position)
    tree = BinaryTree.new(missile_altitudes.first)
    tree.node_count = tree.root.position = root_position
    missile_altitudes.drop(1).each do |missile_altitude|
      tree.add_child(missile_altitude)
    end
    tree
  end

  def find_destruction_routes(missile_tree)
    routes = []
    missile_tree.preorder do |tree_node|
      next if routes.any? { |r| r.include?(tree_node.position) }
      routes << tree_node.leftmost_branch.map { |node| node.position }
    end
    routes
  end
end
