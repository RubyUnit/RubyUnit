require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Class'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Class assertions
  #
  class TC_Class < AssertionsTestCase
    include ClassData

    ##
    # Test assertKindOf
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertKindOfTest klass, object
      assertKindOf klass, object
    end

    ##
    # Test assertKindOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # def assertKindOfFailTest klass, object
    # end

    ##
    # Test assertKindOf with message
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertKindOfWithMessageTest klass, object, message
      assertKindOf klass, object, message
    end

    ##
    # Test assertKindOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    # def assertKindOfFailWithMessageTest klass, object, message
    # end
  end
end
