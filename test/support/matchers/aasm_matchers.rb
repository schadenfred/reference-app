
module Support
  module Matchers
    module AASMMatchers
      
      def assert_states(r, *states)
        publishables.each do |record|
          states.each { |state| assert record.method(state).call } 
        end 
      end
      
      def assert_transition(to_state, *events)
        publishables.each do |record|
          events.each { |event| record.method(event).call } 
          assert record.method(to_state).call
        end
      end
      
      def refute_transition(to_state, *events) 
        publishables.each do |record|
          events.each do |e|
            fire = -> { record.method(e).call }
            e.eql?(events.last) ? assert_raises { fire.() } : fire.()
          end 
        end
      end 

      def assert_controller_transitions
        publishables.each do |r|
        { writer: { 
            archive: :archived?,
            submit: :submitted?,
            withdraw: :draft?
          },
          editor: {
            reject: :rejected?,
            publish: [:submit!, :published?]
          }
        }.each do  |f,v| 
            v.each {|a,s| assert_controller_transition(f,r,a,s) } 
          end 
        end 
      end

      def assert_controller_transition(f, r, a, s)
        meta = [f, r, a, s].map(&:to_s).join(' ')
        authenticated_user(users(f))
        if s.is_a?(Array)
          r.method(s.shift).call
           s = s.pop
        end 
        patch(url_for([a, r]))
        assert_response :redirect, msg: meta
        assert r.reload.method(s).call, msg: meta
      end
    end 
  end 
end 