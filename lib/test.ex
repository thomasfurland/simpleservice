defmodule Example do
  use SimpleService, nodes: [:"1@127.0.0.1", :"2@127.0.0.1"]

  defcall remote(world) do 
    {Node.self(), world}
  end
end
