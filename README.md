# SimpleService

This is a library to explore/play with the `def` macro and to see if remote node calls and casts
can be abstracted in a simple way to reduce boilerplate code namely with `erpc`.

## Setup
The module defined below can be accessed via iex session. 

It prints out the current node name running the function to demonstrate remote calls.

```elixir
defmodule Example do
  use SimpleService, nodes: [:"1@127.0.0.1", :"2@127.0.0.1"]

  defcall remote(world) do 
    {Node.self(), world}
  end
end
```
All we need to do is start two iex sessions and run the `remote` function in one of those sessions

```bash
iex --name 1@127.0.0.1 --cookie monster -S mix
iex --name 2@127.0.0.1 --cookie monster -S mix
```
