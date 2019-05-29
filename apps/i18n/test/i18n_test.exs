defmodule I18nTest do
  use ExUnit.Case
  doctest I18n

  test "greets the world" do
    assert I18n.hello() == :world
  end
end
