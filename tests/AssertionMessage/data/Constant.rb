module AssertionMessageTests
  #
  # Data provider for RubyUnit::AssertionFailure class Test Case
  #
  module ConstantData
    def constantData
      [
        ##
        # Baisc assertion messages
        [             'FAILING'],
        [        'ASSERT_ERROR'],
        [    'ASSERT_NOT_ERROR'],
        [   'ASSERT_TRUE_ERROR'],
        [  'ASSERT_FALSE_ERROR'],
        [    'ASSERT_NIL_ERROR'],
        ['ASSERT_NOT_NIL_ERROR'],

        ##
        # Class assertion messages
        [          'ASSERT_KIND_OF_ERROR'],
        [      'ASSERT_NOT_KIND_OF_ERROR'],
        [      'ASSERT_INSTANCE_OF_ERROR'],
        [  'ASSERT_NOT_INSTANCE_OF_ERROR'],
        [       'ASSERT_DESCENDENT_ERROR'],
        [   'ASSERT_NOT_DESCENDENT_ERROR'],
        [            'ASSERT_CONST_ERROR'],
        [    'ASSERT_CONST_DEFINED_ERROR'],
        ['ASSERT_CONST_NOT_DEFINED_ERROR'],

        ##
        # Collection assertion messages
        [        'ASSERT_INCLUDE_ERROR'],
        [    'ASSERT_NOT_INCLUDE_ERROR'],
        [          'ASSERT_EMPTY_ERROR'],
        [      'ASSERT_NOT_EMPTY_ERROR'],

        ##
        # Comparison assertion messages
        [             'ASSERT_EQUAL_ERROR'],
        [         'ASSERT_NOT_EQUAL_ERROR'],
        [       'ASSERT_GREATERTHAN_ERROR'],
        ['ASSERT_GREATERTHANOREQUAL_ERROR'],
        [          'ASSERT_LESSTHAN_ERROR'],
        [   'ASSERT_LESSTHANOREQUAL_ERROR'],
        [             'ASSERT_MATCH_ERROR'],
        [         'ASSERT_NOT_MATCH_ERROR'],
        [              'ASSERT_SAME_ERROR'],
        [          'ASSERT_NOT_SAME_ERROR'],

        ##
        # Exception assertion messages
        ['ASSERT_NOTHING_RAISED_ERROR'],
        [ 'ASSERT_RAISE_MESSAGE_ERROR'],
        [ 'ASSERT_RAISE_KIND_OF_ERROR'],
        ['ASSERT_RAISE_EXPECTED_ERROR'],

        ##
        # Method assertion messages
      ]
    end
  end
end
