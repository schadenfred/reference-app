
module Support
  module Matchers
    module PunditMatchers

      def assert_permit(*args)
        decide_permit(*args, true)
      end

      def refute_permit(*args)
        decide_permit(*args, false)
      end

      private 
      
      def set_permit_default(*args)
        @permit_action = args.first
        @permit_user = args[1] || user
        @permit_record = args[2] || record
      end

      def is_permitted?
        cls = infer_class_from_test_name
        cls.new(@permit_user, @permit_record).public_send("#{@permit_action}?")
      end

      def decide_permit(*args)
        if args.first.is_a?(Array) 
          args.shift.each { |a| decide_permit(a, *args) }
        else 
          set_permit_default(*args)
          msg = ["User #{@permit_user.inspect} must",
           "#{args.last ? '' : 'not'}",
            "be permitted to #{@permit_action} #{@permit_record}"
          ].join(' ')
          args.last ? (assert is_permitted?, msg) : (refute is_permitted?, msg) 
        end
      end

      def infer_class_from_test_name 
        "#{record.class.name}Policy".constantize 
      end
    end
  end
end
