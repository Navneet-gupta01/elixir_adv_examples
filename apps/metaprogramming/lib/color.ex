defmodule Color do
  def get_data_type(data) when is_atom(data), do: {:ok, :atom}

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

  def do_color(id, text, options)
  def do_color(id, text, )
end
