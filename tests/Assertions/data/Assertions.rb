module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module AssertionsTestsData
    #
    # Create data string that will be in assertion from data list
    # * This makes me really want to build RubyUnit::AssertionFailure properly
    #
    def data_string data = {}
      error_message = ''
      data.each do |index, value|
        error_message << "\n#{index}:\n\t#{value.inspect}"
      end
      error_message
    end

    def failData
      [
        ['message'                            ],
        ['message', {:string=>'test',:int=>10}],
      ]
    end
  end
end
