defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[^[:alnum:]-]+/u, trim: true)
    |> Enum.reduce(%{}, &increment_count/2)
  end

  defp increment_count(word, acc) do
    word = String.downcase(word)
    Map.put(acc, word, Map.get(acc, word, 0)+1)
  end

end
