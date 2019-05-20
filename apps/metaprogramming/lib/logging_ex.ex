defmodule LoggingEx do
  defmacro log(msg) do
    if Application.get_env(:logger, :enabled) do
      quote do
        IO.puts("Logged message: #{unquote(msg)}")
      end
    end
  end
end

# we Defined a Logging utiltiy that will log only if enabled from environment.

defmodule TestLoggingEx do
  require LoggingEx

  def test do
    LoggingEx.log("This is a log message")
  end
end

# Test 1 :- The below should log
# MIX_ENV=dev iex -S mix
# iex> TestLoggingEx.test

# Test 2 :- The below should not log
# MIX_ENV=prod iex -S mix
# iex> TestLoggingEx.test
