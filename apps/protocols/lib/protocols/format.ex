defprotocol Protocol.Format do
  import Logger

  @fallback_to_any true
  def format(data, options \\ [])
end

defimpl Protocol.Format, for: String do
  def format(data, _), do: IO.puts(data)
end

defimpl Protocol.Format, for: Any do
  def format(data, _), do: inspect(data)
end

defimpl Protocol.Format, for: Reference do
  import Protocol.Utils

  def format(data, options \\ []) do
    inspect(data) <> new_line()
  end
end

defimpl Protocol.Format, for: BitString do
  import Protocol.Utils

  def format(data, options \\ []) do
    case String.valid?(data) do
      true ->
        colorize("\"#{data}\"", data, options) <> new_line()

      false ->
        colorize("#{inspect(data)}", data, options) <> new_line()
    end
  end
end

defimpl Protocol.Format, for: Integer do
  import Protocol.Utils

  def format(data, options \\ []) do
    colorize("#{data}", data, options) <> new_line()
  end
end

defimpl Protocol.Format, for: Float do
  import Protocol.Utils

  def format(data, options \\ []) do
    "#{:erlang.float_to_binary(data, [:compact, decimals: 15])}" <>
      new_line()
  end
end

defimpl Protocol.Format, for: Atom do
  import Protocol.Utils

  def format(data, options \\ [])

  def format(data, options) when data in [true, false, nil] do
    Atom.to_string(data) <> new_line()
  end

  def format(data, options) do
    colorize(":" <> Atom.to_string(data), data, options) <> new_line()
  end
end
