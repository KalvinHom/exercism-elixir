defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @division [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  @symbols ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number, "", 0)
  end

  defp convert(0, roman, _index), do: roman

  defp convert(number, roman, index) do

    div = Enum.at(@division, index)

    amount = number / div
    rem = rem(number, div)

    roman = add_letter(roman, amount, index)
    convert(rem, roman, index + 1)

  end

  defp add_letter(roman, amount, _index) when amount < 1, do: roman
  defp add_letter(roman, amount, index) do
    letter = Enum.at(@symbols, index)
    add_letter("#{roman}#{letter}", amount - 1, index)
  end
end
