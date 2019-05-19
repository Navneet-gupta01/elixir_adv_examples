defmodule BehavioursTest do
  use ExUnit.Case
  doctest Behaviours

  test "greets the world" do
    assert Behaviours.hello() == :world
  end
end
