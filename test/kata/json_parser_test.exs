defmodule Kata.JsonParserTest do
  alias Kata.JsonParser, as: Parser

  use ExUnit.Case

  doctest Parser, import: true

  describe "Kata.JsonParser.parse/1" do
    test "parses the true keyword" do
      assert Parser.parse("true") == true
    end

    test "parses the false keyword" do
      assert Parser.parse("false") == false
    end

    test "parses the null keyword" do
      assert Parser.parse("null") == nil
    end

    test "parses integers" do
      assert Parser.parse("42") == 42
    end

    test "parses floats" do
      assert Parser.parse("1.7") == 1.7
    end

    test "parses strings" do
      assert Parser.parse(~s("test")) == "test"
    end

    test "parses a list of tokens" do
      assert Parser.parse("[42,true,false,null]") == [42, true, false, nil]
    end

    test "parses an empty object" do
      assert Parser.parse("{}") == []
    end

    test "parses objects with attributes" do
      assert Parser.parse(~s({"name":"John"})) == [name: "John"]
    end

    test "ignores whitespace" do
      assert Parser.parse(~s({ "foo": 42 })) == [foo: 42]
    end
  end
end
