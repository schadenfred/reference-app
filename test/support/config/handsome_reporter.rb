require 'minitest/reporters'
require 'minitest/pride_plugin'

module Minitest::Reporters
  class HandsomeReporter < DefaultReporter

    def initialize(options = {})
      @pride_io = Minitest::PrideLOL.new($stdout)
      super
    end

    def record(test)
      self.class.superclass.superclass
                .instance_method(:record).bind(self).call(test)

      print "#{"%.2f" % test.time} = " if options[:verbose]

      @pride_io.print(test.result_code)

      if @fast_fail && (test.skipped? || test.failure)
        puts
        print_failure(test)
      end
    end
  end
end

reporter_options = { fast_fail: true, slow_count: 0 }
reporter = Minitest::Reporters::HandsomeReporter.new(reporter_options)
Minitest::Reporters.use!(reporter)
