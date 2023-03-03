defmodule SimpleServiceTest do
  use ExUnit.Case
  use SimpleService, nodes: ["1@1", "2@1"]

  defcall bar(foo), do: foo

  defcall jan do
    "hello"
  end

  test "defc" do
    bar([])
    |> IO.inspect()

    jan() |> IO.inspect()
  end
end
