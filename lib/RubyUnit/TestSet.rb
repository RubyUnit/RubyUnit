module RubyUnit
  ##
  # Test Sets are a collection of Test Cases
  class TestSet
    TYPE = 'Test Case'

    def initialize test_cases
      puts caller.first
      import test_cases
    end

    def import test_cases
      raise TypeError, "File list must be an Array, got #{test_cases.class}" unless test_cases.is_a? Array
      test_cases.each do |test_case|
        puts "%20s : %s" % ['Adding ' + self.class::TYPE, test_case] if RubyUnit.debug
        require test_case
      end
    end
  end
end
