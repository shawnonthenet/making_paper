defmodule MakingPaperTest do
  use ExUnit.Case
  doctest MakingPaper

  test "greets the world" do
    assert MakingPaper.hello() == :world
  end
end
