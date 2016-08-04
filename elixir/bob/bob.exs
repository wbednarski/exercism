defmodule Message do
  def is_question(input), do: String.ends_with?(input, "?")
  def is_yell(input), do: String.upcase(input) == input && Regex.match?(~r/\p{L}/, input)
  def is_silence(input), do: String.trim(input) == ""
end

defmodule Bob do
  def hey(input) do
    cond do
      Message.is_question(input) -> "Sure."
      Message.is_yell(input) -> "Whoa, chill out!"
      Message.is_silence(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
