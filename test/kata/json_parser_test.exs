defmodule Kata.JsonParserTest do
  alias Kata.JsonParser, as: Parser

  use ExUnit.Case

  doctest Parser, import: true

  describe "Kata.JsonParser.parse/1" do
    @tag :skip
    test "parses a simple JSON string" do
      assert Parser.parse(~s({ "key": "value" })) == :to_be_determined
    end
  end
end
