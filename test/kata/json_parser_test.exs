defmodule Kata.JsonParserTest do
  alias Kata.JsonParser, as: Parser

  use ExUnit.Case

  doctest Parser, import: true

  describe "Kata.JsonParser.parse/1" do
    test "recognises the true keyword" do
      assert Parser.parse("true") == [{true, 1}]
    end

    test "recognises the false keyword" do
      assert Parser.parse("false") == [{false, 1}]
    end

    test "recognises the null keyword" do
      assert Parser.parse("null") == [{:null, 1}]
    end

    test "recognises symbols" do
      assert Parser.parse("{null:true}") == ["{": 1, null: 1, ":": 1, true: 1, "}": 1]
    end

    test "recognises strings" do
      assert Parser.parse(~s("test")) == [{:string, 1, "test"}]
    end

    test "recognises integers" do
      assert Parser.parse(~s({"foo": 42})) == [{:"{", 1}, {:string, 1, "foo"}, {:":", 1}, {:int, 1, 42}, {:"}", 1}]
    end

    test "recognises floats" do
      assert Parser.parse(~s({"bar": 1.7})) == [{:"{", 1}, {:string, 1, "bar"}, {:":", 1}, {:float, 1, 1.7}, {:"}", 1}]
    end

    test "ignores whitespace" do
      assert Parser.parse("{ null: true }") == ["{": 1, null: 1, ":": 1, true: 1, "}": 1]
    end
  end
end
