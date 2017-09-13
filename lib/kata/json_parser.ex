defmodule Kata.JsonParser do
  @moduledoc """
  Parse JSON documents.
  """

  @doc """
  Transform a string of JSON into a meaninful data structure.

  ## Examples

      iex> parse(~s({ "foo": 42 }))
      :to_be_determined

  """
  def parse(str) do
    with {:ok, tokens, _} <- str |> to_charlist |> :json_lexer.string,
         {:ok, result} <- tokens |> :json_parser.parse
    do
      result
    else
      {:error, reason, _} ->
        reason
      {:error, {_, :json_parser, reason}} ->
        to_string(reason)
    end
  end
end
