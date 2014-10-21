module RubyUnitTests
  ##
  # Data provider for RubyUnit module
  #
  module RubyUnitTestsData
    def constantData
      [
        [           'VERSION'],
        ['INVALID_DEBUG_MODE'],
      ]
    end

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
