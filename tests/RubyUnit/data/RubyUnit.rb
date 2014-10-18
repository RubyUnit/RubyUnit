module RubyUnitTests
  #
  # Data provider for RubyUnit::GemInfo module Test Case
  #
  module RubyUnitTestsData
    def invalidDebugModeData
      [
        [      42],
        [     nil],
        ['String'],
        [   Class],
        [/Regexp/],
      ]
    end
  end
end
