module RubyUnit
  ##
  # Test Sets are a collection of Test Cases
  class TestSet
    ##
    # Create a test set and import test cases.
    def initialize test_cases
      $:.unshift '.' unless $:.include? '.'
      import test_cases
    end

    ##
    # Import the test cases for this test set
    def import test_cases
      raise TypeError, "File list must be an Array, got #{test_cases.class}" unless test_cases.is_a? Array
      test_cases.each do |test_case|
        puts "%20s : %s" % ['Adding ' + self.class.type, test_case] if RubyUnit.debug
        require test_case
      end
    end

    ##
    # Defining type of files includes for RubyUnit::TestSuite used with --debug
    def self.type
      'Test Case'
    end
  end
end
