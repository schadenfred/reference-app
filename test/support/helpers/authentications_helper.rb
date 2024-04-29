module Support 
  module Helpers 
    module AuthenticationsHelper
      
      def default_user 
        users(:one)
      end
    
      def authenticated_user(user=nil)
        sign_in(user ||= default_user)
      end
    
      def authenticated_request(auth_user=nil, auth_request=nil)
        authenticated_user((auth_user || user))
        auth_request || request 
      end
    
      def assert_expected_response(response=nil, auth_user=nil, auth_request=nil)
        authenticated_user((auth_user || default_user))
        auth_request || request 
        must_respond_with(response || :redirect)
      end
    end
  end
end