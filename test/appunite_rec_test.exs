defmodule AppuniteRecTest do
  use ExUnit.Case
  doctest AppuniteRec

  test "greets the world" do
    assert AppuniteRec.hello() == :world
  end
end
