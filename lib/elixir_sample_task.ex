defmodule ElixirSample.Task do
  def h do
    IO.puts "hi"
  end
  
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

# {:ok, pid} = ElixirSample.Task.start_link
# send pid, {:put, :hello, :world}
# send pid, {:get, :hello, self()}
