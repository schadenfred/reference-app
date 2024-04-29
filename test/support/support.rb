
module Support
  module Helpers
    include AuthenticationsHelper
    include EmailHelper
    include FileHelper
    include PlaybackHelper
  end

  module Matchers
    include AASMMatchers
    include PunditMatchers
    include RequestMatchers
  end
end
