module Imprenta
  class StaticServer

    attr_accessor :custom_domain

    def initialize
      @middleware_stack = Imprenta.configuration.middlewares
    end

    def call(env)
      @app = build_app
      @app.call(env)
    end

    private

    def build_app
      @app ||= @middleware_stack.build(Imprenta::FileRack.new)
    end

  end
end
