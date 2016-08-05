defmodule Message do
  @moduledoc """
    Defines functions that determinate sentence type, like a question, shouting and silence.
  """
  def is_question(input), do: String.ends_with?(input, "?")
  def is_yell(input), do: String.upcase(input) == input && String.downcase(input) != input
  def is_silence(input), do: String.trim(input) == ""
end

defmodule Bob do
  import Message

  def hey(input) do
    cond do
      is_question(input) -> "Sure."
      is_yell(input) -> "Whoa, chill out!"
      is_silence(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
