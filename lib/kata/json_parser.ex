defmodule Kata.JsonParser do
  @moduledoc """
  Parse JSON documents.
  """

  @doc """
  Transform a string of JSON into a list of tokens.

  ## Examples

      iex> parse("null")
      [{:null, 1}]

      iex> parse("true")
      [{true, 1}]

      iex> parse("false")
      [{false, 1}]

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
