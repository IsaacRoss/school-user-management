defmodule UMTest do
  use ExUnit.Case
  doctest UM

  test "greets the world" do
    assert UM.hello() == :world
  end
end
