class ServiceBase
  class << self
    attr_accessor :args

    def run(args, action)
      self.args = args
      send(action)
    end
  end
end
