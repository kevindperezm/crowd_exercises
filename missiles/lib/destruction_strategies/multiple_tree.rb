require_relative '../binary_tree/tree'

module DestructionStrategies
  # A algorithm implmentation that builds a tree
  # for each missile and find the optimal route
  # among all of the possible routes.
  class MultipleTree
    def initialize(missiles)
      @missiles = missiles
      @trees = []
      @destruction_routes = []
    end

    def best_destruction_route
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
      @missiles.each_index do |i|
        @trees << build_tree(@missiles.drop(i))
      end
    end

    def find_destruction_routes_in_trees
      @trees.each do |tree|
        @destruction_routes += find_destruction_routes(tree)
      end
    end

    def build_tree(missile_altitudes)
      tree = BinaryTree::Tree.new(missile_altitudes.first)
      missile_altitudes.drop(1).each do |missile_altitude|
        tree.add_child(missile_altitude)
      end
      tree
    end

    def find_destruction_routes(missile_tree)
      routes = []
      missile_tree.preorder do |tree_node|
        next if routes.any? { |r| r.include?(tree_node.value.position) }
        routes << tree_node.leftmost_branch.map { |node| node.value.position }
      end
      routes
    end
  end
end
