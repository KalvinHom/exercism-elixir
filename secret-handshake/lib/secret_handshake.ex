defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> jump(code)
    |> close(code)
    |> double_blink(code)
    |> wink(code)
    |> reverse(code)
  end

  def jump(commands, code) do
    if (code &&& 0b1000) == 0b1000 do
      ["jump" | commands]
    else
      commands
    end
  end

  def wink(commands, code) do
    if (code &&& 0b1) == 0b1 do
      ["wink" | commands]
    else
      commands
    end
  end

  def double_blink(commands, code) do
    if (code &&& 0b10) == 0b10 do
      ["double blink" | commands]
    else
      commands
    end
  end

  def close(commands, code) do
    if (code &&& 0b100) == 0b100 do
      ["close your eyes" | commands]
    else
      commands
    end
  end

  def reverse(commands, code) do
    if (code &&& 0b10000) == 0b10000 do
      Enum.reverse(commands)
    else
      commands
    end
  end
end
