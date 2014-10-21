require_relative 'Assertions/Basic'       # Basic assertions
require_relative 'Assertions/Classes'     # Class assertions
require_relative 'Assertions/Collections' # Collection assertions
require_relative 'Assertions/Comparisons' # Comparison assertions
require_relative 'Assertions/Exceptions'  # Exception assertions
require_relative 'Assertions/Methods'     # Method assertions

module RubyUnit
  ##
  # Assertions that can be used by RubyUnit::TestCase
  #
  module Assertions
    ##
    # Tracks the total number of assertions made during the tests
    @@assertions = 0

    def self.assertions
      @@assertions
    end

    def self.add_assertion
      @@assertions += 1
    end

    include Assertions::Basic
    include Assertions::Classes
    include Assertions::Collections
    include Assertions::Comparisons
    include Assertions::Exceptions
    include Assertions::Methods
  end
end
