require 'vcr' 

module Support 
  module Helpers 
    module PlaybackHelper

      def playback(&block)
        cassette_name = self.inspect.to_s.split('__')[1..2].reverse.join('/')
        VCR.use_cassette(cassette_name, record: :once) do
          yield
        end
      end 
    end 
  end
end