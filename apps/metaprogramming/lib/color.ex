defmodule Color do
  def get_data_type(data) when is_atom(data), do: {:ok, :atom}
  def get_data_type(_), do: :unknown

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      alias unquote(__MODULE__)

      def colorize(text, data, options) do
        data
        |> get_data_type
        |> do_color(text, options[:color])
      end
    end
  end

  def do_color(id, text, do_color)
  def do_color(_id, text, false), do: text
  def do_color(:unknown, text, _), do: text

  def do_color({:ok, type}, text, _) do
    color = read_color_from_config() || read_color_from_file() || default_color
  end
end
