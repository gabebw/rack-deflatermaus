require "rack/deflater"

require "rack/deflatermaus/player"
require "rack/deflatermaus/version"

module Rack
  class Deflatermaus
    def initialize(app)
      @deflater = Deflater.new(app)
    end

    def call(env)
      Player.new.play

      @deflater.call(env)
    end
  end
end
