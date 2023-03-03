defmodule SimpleService.Local do
  def call(_node, fnc, _opts), do: fnc.()
  def cast(_node, fnc, _opts), do: fnc.()
end
