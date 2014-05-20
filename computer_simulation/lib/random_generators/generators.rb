module Generators
 
  class Multiplicative
    
    SEED = 203
    MODULO = 100
    X0 = 9
    
    def initialize(options = {})
    	@seed = options[:seed] || SEED
    	@modulo = options[:modulo] || MODULO
    	@x0 = options[:x0] || X0
    end
 
    def next
      @last_value = @seed * (@last_value || @x0) % @modulo
    end
 
  end
 
end