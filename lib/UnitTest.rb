require 'UnitTest/TestCase'

module UnitTest
end

require 'UnitTest/Runner'
# Automatically run test cases
Module.new do
  if $ERROR_INFO.nil?
    at_exit do
      UnitTest::Runner.run
    end
  end
end
