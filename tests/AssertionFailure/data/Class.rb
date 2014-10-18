module AssertionFailureTests
  #
  # Data provider for RubyUnit::AssertionFailure class Test Case
  #
  module ClassTestsData
    def constantData
      [
        # Baisc assertion messages
        [             'FAILING'],
        [        'ASSERT_ERROR'],
        [    'ASSERT_NOT_ERROR'],
        [   'ASSERT_TRUE_ERROR'],
        [  'ASSERT_FALSE_ERROR'],
        [    'ASSERT_NIL_ERROR'],
        ['ASSERT_NOT_NIL_ERROR'],
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
      ]
    end
  end
end
