defmodule Kata.JsonParserTest do
  alias Kata.JsonParser, as: Parser

  use ExUnit.Case

  doctest Parser, import: true

  describe "Kata.JsonParser.parse/1" do
    test "recognises symbols" do
      assert Parser.parse("{null:true}") == ["{": 1, null: 1, ":": 1, true: 1, "}": 1]
    end

    @tag :skip
    test "parses a simple JSON string" do
      assert Parser.parse(~s({ "key": "value" })) == :to_be_determined
    end
  end
end
