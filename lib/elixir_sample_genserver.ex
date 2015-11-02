defmodule ElixirSample.Genserver do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number+1}
  end
end


# {:ok, pid } = GenServer.start_link(ElixirSample.Genserver, 10)
