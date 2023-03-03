defmodule SimpleService.Erpc do
  def call(node, fnc, opts) do
    :timer.tc(fn ->
      try do
        :erpc.call(node, fnc, opts[:timeout])
      rescue
        e -> {:error, {"unavailable", details: e}}
      end
    end)
  end
  
  def cast(node, fnc, _opts) do
    :timer.tc(fn ->
      try do
        :erpc.cast(node, fnc)
      rescue
        e -> {:error, {"unavailable", details: e}}
      end
    end)
  end
end
