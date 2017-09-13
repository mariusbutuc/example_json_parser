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

    @tag :skip
    test "recognises symbols" do
      assert Parser.parse("{null:true}") == ["{": 1, null: 1, ":": 1, true: 1, "}": 1]
    end

    @tag :skip
    test "recognises strings" do
      assert Parser.parse(~s("test")) == [{:string, 1, "test"}]
    end

    @tag :skip
    test "recognises integers" do
      assert Parser.parse(~s({"foo": 42})) == [{:"{", 1}, {:string, 1, "foo"}, {:":", 1}, {:int, 1, 42}, {:"}", 1}]
    end

    @tag :skip
    test "recognises floats" do
      assert Parser.parse(~s({"bar": 1.7})) == [{:"{", 1}, {:string, 1, "bar"}, {:":", 1}, {:float, 1, 1.7}, {:"}", 1}]
    end

    @tag :skip
    test "ignores whitespace" do
      assert Parser.parse("{ null: true }") == ["{": 1, null: 1, ":": 1, true: 1, "}": 1]
    end
  end
end
