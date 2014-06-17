# Class that records method callings and
# later playback them against an object.
class Recorder
  attr_accessor :recorded_methods

  def initialize
    @recorded_methods = {}
  end

  def playback(object)
    executed_methods = call_recorded_methods_on(object)
    puts "Executed actions #{executed_methods}"
    object
  end

  def method_missing(name, *params)
    record_method_call(name, params)
    puts "#{name} has been recorded"
    self
  end

  private

  def record_method_call(name, params)
    @recorded_methods[name] = params
  end

  def call_recorded_methods_on(object)
    executed_methods = []
    @recorded_methods.each do |method, params|
      next unless object.respond_to?(method)
      object.public_send(method, *params)
      executed_methods << method
    end
    executed_methods
  end
end
