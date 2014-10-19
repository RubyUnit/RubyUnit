module RubyUnit
  ##
  # module containing text for assertion errors and messages
  #
  module AssertionMessage
    ##
    # Error messages
    FAILING = 'Failing test'
    FAILURE = 'Failed to ASSERT'

    ##
    # Basic assertions
    ASSERT_ERROR         = 'Value IS NOT false OR nil'
    ASSERT_NOT_ERROR     = 'Value IS false OR nil'
    ASSERT_TRUE_ERROR    = 'Value IS EXACLTY true' 
    ASSERT_FALSE_ERROR   = 'Value IS EXACLTY false'
    ASSERT_NIL_ERROR     = 'Value IS EXACTLY nil'
    ASSERT_NOT_NIL_ERROR = 'Value IS NOT nil'

    ##
    # Class assertions
    ASSERT_KIND_OF_ERROR           = 'Object IS kind_of?'
    ASSERT_NOT_KIND_OF_ERROR       = 'Object IS NOT kind_of?'
    ASSERT_INSTANCE_OF_ERROR       = 'Object IS instance_of?'
    ASSERT_NOT_INSTANCE_OF_ERROR   = 'Object IS NOT instance_of?'
    ASSERT_DESCENDENT_ERROR        = 'Object IS a descendent'
    ASSERT_NOT_DESCENDENT_ERROR    = 'Object IS NOT a descendent'
    ASSERT_CONST_ERROR             = 'Object defines correct constant'
    ASSERT_CONST_DEFINED_ERROR     = 'Object defines constant'
    ASSERT_CONST_NOT_DEFINED_ERROR = 'Object does NOT define constant'

    ##
    # Collection assertions
    ASSERT_INCLUDE_ERROR     = 'Collection includes object'
    ASSERT_NOT_INCLUDE_ERROR = 'Collection does NOT include object'
    ASSERT_EMPTY_ERROR       = 'Collection IS empty'
    ASSERT_NOT_EMPTY_ERROR   = 'Collection IS NOT empty'

    ##
    # Comparison assertions
    ASSERT_EQUAL_ERROR              = 'Objects ARE equal'
    ASSERT_NOT_EQUAL_ERROR          = 'Objects ARE NOT equal'
    ASSERT_GREATERTHAN_ERROR        = 'Object IS greater than expected'
    ASSERT_GREATERTHANOREQUAL_ERROR = 'Object IS greater than OR equal to expected'
    ASSERT_LESSTHAN_ERROR           = 'Object IS less than expected'
    ASSERT_LESSTHANOREQUAL_ERROR    = 'Object IS less than OR equal to expected'
    ASSERT_MATCH_ERROR              = 'Value matches Regexp'
    ASSERT_NOT_MATCH_ERROR          = 'Value does NOT match Regexp'
    ASSERT_SAME_ERROR               = 'Objects ARE the same'
    ASSERT_NOT_SAME_ERROR           = 'Objects ARE NOT the same'

    ##
    # Exception assertions
    ASSERT_NOTHING_RAISED_ERROR = 'Exception WAS NOT raised'
    ASSERT_RAISE_MESSAGE_ERROR  = 'Exception message WAS raised'
    ASSERT_RAISE_KIND_OF_ERROR  = 'Exception Class WAS raised'
    ASSERT_RAISE_EXPECTED_ERROR = 'Expected Exception WAS raised'

    ##
    # Method assertions
    ASSERT_RESPOND_TO_ERROR          = 'Object responds to method'
    ASSERT_NOT_RESPOND_TO_ERROR      = 'Object does NOT respond to method'
    ASSERT_METHOD_ERROR              = 'Object defines method'
    ASSERT_NOT_METHOD_ERROR          = 'Object does NOT define method'
    ASSERT_INSTANCE_METHOD_ERROR     = 'Object defines instance method'
    ASSERT_NOT_INSTANCE_METHOD_ERROR = 'Object does NOT define instance method'
    ASSERT_CLASS_METHOD_ERROR        = 'Object defines class method'
    ASSERT_NOT_CLASS_METHOD_ERROR    = 'Object does NOT define instance method'
  end
end
