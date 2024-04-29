module Support
  module Matchers
    module RequestMatchers

      def assert_successful_request(request)
        sign_in users(:one)
        request 
        must_respond_with :success
      end

      def assert_redirects_logged_out_user
        sign_out :user
        request 
        assert_redirected_to new_user_session_path
      end
    end
  end
end
