require "audite"

module Rack
  class Deflatermaus
    class Player
      PATH_TO_OVERTURE = ::File.expand_path("../overture.mp3", __FILE__)

      def initialize
        @audite = Audite.new
      end

      def play
        @audite.load(PATH_TO_OVERTURE)
        @audite.start_stream

        # We need to do something (or just sleep) while the song plays in the
        # background thread.
        #
        # The song is 7:30, but sleeping `@audite.length_in_seconds` sleeps
        # longer than that. Sleeping for 5 minutes is safely under 7:30.
        sleep 60 * 5
        @audite.stop_stream
      end
    end
  end
end
