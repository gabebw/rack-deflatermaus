require "rack/deflatermaus/version"
require "rack/deflatermaus/player"

module Rack
  class Deflatermaus
    def initialize(app)
      @app = app
    end

    def call(env)
      Player.new.play

      @app.call(env)
    end
  end
end
