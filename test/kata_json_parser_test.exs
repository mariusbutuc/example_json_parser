defmodule Kata.JsonParserTest do
  use ExUnit.Case
  doctest Kata.JsonParser

  test "greets the world" do
    assert Kata.JsonParser.hello() == :world
  end
end
