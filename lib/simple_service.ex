defmodule SimpleService do
  defmacro __using__(opts \\ []) do
    quote do
      if Mix.env() === :test do
        @default_module SimpleService.Local
      else
        @default_module SimpleService.Erpc
      end

      @opts unquote(opts) |> Keyword.put_new(:timeout, 1000)

      @nodes Keyword.get(@opts, :nodes, [])
      @module Keyword.get(@opts, :module, @default_module)

      import SimpleService, only: [defcall: 2, defcast: 2]
    end
  end

  
  defmacro defcall(call, do: block) do
    quote do
      def unquote(call) do
        @nodes
        |> Enum.random()
        |> @module.call(fn -> unquote(block) end, @opts)
      end
    end
  end
  
  defmacro defcast(cast, do: block) do
    quote do
      def unquote(cast) do
        @nodes
        |> Enum.random()
        |> @module.cast(fn -> unquote(block) end, @opts)
      end
    end
  end
end

