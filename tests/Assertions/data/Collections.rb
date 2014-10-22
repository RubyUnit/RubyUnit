require_relative 'ObjectTypes'

module AssertionsTests
  #
  # Data provider for RubyUnit::Assertions Collections assertions
  #
  module CollectionsData
    include ObjectTypes

    def assertIncludeData
      [
        # Strings
        [            '',     ''],
        [ "Multi\nLine",   "\n"],
        [ "Multi\nLine", 'Line'],
        [     'abcdefg',  'abc'],
        [     'abcdefg',  'cde'],
        [     'abcdefg',  'efg'],
        ["#{'abcdefg'}",  'abc'],
        ["#{'abcdefg'}",  'cde'],
        ["#{'abcdefg'}",  'efg'],
        # Ranges
        [   (-5..-1),    -5],
        [   (-5..-1),    -3],
        [  (-5...-1),    -2],
        [    (0..42),     0],
        [    (0..42),    21],
        [   (0...42),    41],
        [ ('a'..'g'),   'a'],
        [ ('a'..'g'),   'e'],
        [('a'...'g'),   'f'],
        # Arrays
        [['String', 42, {:hash=>42}, (0..42), /Regexp/],    'String'],
        [['String', 42, {:hash=>42}, (0..42), /Regexp/], {:hash=>42}],
        [['String', 42, {:hash=>42}, (0..42), /Regexp/],    /Regexp/],
        # Hashes
        [{:string=>'String','int'=>42,:regexp=>/Regexp/}, :string],
        [{:string=>'String','int'=>42,:regexp=>/Regexp/},   'int'],
        [{:string=>'String','int'=>42,:regexp=>/Regexp/}, :regexp],
      ]
    end
    alias_method :assertNotIncludeFailData, :assertIncludeData

    def assertIncludeFailData
      [
        # Strings
        [            '',    'ab'],
        [ "Multi\nLine",    "\t"],
        [ "Multi\nLine", 'Lines'],
        [     'abcdefg',   'fgh'],
        ["#{'abcdefg'}",     '0'],
        ["#{'abcdefg'}",     'h'],
        # Ranges
        [   (-5..-1),    -6],
        [  (-5...-1),    -1],
        [    (0..42),    -1],
        [   (0...42),    42],
        [ ('a'..'g'),   '0'],
        [('a'...'g'),   'g'],
        # Arrays
        [['String', 42, {:hash=>42}, (0..42), /Regexp/],   'Integer'],
        [['String', 42, {:hash=>42}, (0..42), /Regexp/], {:hash=>41}],
        [['String', 42, {:hash=>42}, (0..42), /Regexp/], /^Missing$/],
        # Hashes
        [{:string=>'String','int'=>42,:regexp=>/Regexp/}, :integer],
        [{:string=>'String','int'=>42,:regexp=>/Regexp/},   'hash'],
        [{:string=>'String','int'=>42,:regexp=>/Regexp/},   Object],
      ]
    end
    alias_method :assertNotIncludeData, :assertIncludeFailData

    def assertIncludeInvalidData
      add_parameter(fixnumObjects)   +
      add_parameter(bignumObjects)   +
      add_parameter(floatObjects)    +
      add_parameter(rationalObjects) +
      add_parameter(complexObjects)  +
      add_parameter(timeObjects)     +
      add_parameter(regexpObjects)
    end
    alias_method :assertNotIncludeInvalidData, :assertIncludeInvalidData

    def assertIncludeWithMessageInvalidData
      add_parameter assertIncludeInvalidData
    end
    alias_method :assertNotIncludeWithMessageInvalidData, :assertIncludeWithMessageInvalidData

    def assertIncludeWithMessageData
      add_parameter assertIncludeData
    end
    alias_method :assertNotIncludeWithMessageFailData, :assertIncludeWithMessageData

    def assertIncludeWithMessageFailData
      add_parameter assertIncludeFailData
    end
    alias_method :assertNotIncludeWithMessageData, :assertIncludeWithMessageFailData

    def assertEmptyData
      [
        [''],
        [[]],
        [{}],
      ]
    end
    alias_method :assertNotEmptyFailData, :assertEmptyData

    def assertEmptyFailData
      stringObjects - [[""]] +
      arrayObjects  - [[[]]] +
      hashObjects   - [[{}]]
    end
    alias_method :assertNotEmptyData, :assertEmptyFailData

    def assertEmptyInvalidData
      fixnumObjects   +
      bignumObjects   +
      floatObjects    +
      rationalObjects +
      complexObjects  +
      timeObjects     +
      rangeObjects    +
      regexpObjects
    end
    alias_method :assertNotEmptyInvalidData, :assertEmptyInvalidData

    def assertEmptyWithMessageInvalidData
      add_parameter assertEmptyInvalidData
    end
    alias_method :assertNotEmptyWithMessageInvalidData, :assertEmptyWithMessageInvalidData

    def assertEmptyWithMessageData
      add_parameter assertEmptyData
    end
    alias_method :assertNotEmptyWithMessageFailData, :assertEmptyWithMessageData

    def assertEmptyWithMessageFailData
      add_parameter assertEmptyFailData
    end
    alias_method :assertNotEmptyWithMessageData, :assertEmptyWithMessageFailData
  end
end
