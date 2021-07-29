defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(& shift_char(&1, shift))
    |> List.to_string()
  end

  def shift_char(codepoint, shift) when codepoint >= ?A and codepoint <= ?Z do
    Kernel.rem(codepoint - ?A + shift, 26) + ?A
  end

  def shift_char(codepoint, shift) when codepoint >= ?a and codepoint <= ?z do
    Kernel.rem(codepoint - ?a + shift, 26) + ?a
  end

  def shift_char(codepoint, _shift), do: codepoint
end
