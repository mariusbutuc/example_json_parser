defmodule Kata.JsonParser do
  @moduledoc """
  Parse JSON documents.
  """

  @doc """
  Transform a string of JSON into a list of tokens.

  ## Examples

      iex> parse(~s({ "foo": 42 }))
      [{:"{", 1}, {:string, 1, "foo"}, {:":", 1}, {:int, 1, 42}, {:"}", 1}]

  """
  def parse(str) do
    case str |> to_charlist |> :json_lexer.string do
      {:ok, tokens, _line} ->
        tokens
      {:error, reason, _line} ->
        reason
    end
  end
end
