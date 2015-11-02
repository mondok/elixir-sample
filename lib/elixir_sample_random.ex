defmodule ElixirSample.Random do

  def soft_immutability do
    a = "test"
    f0 = fn -> IO.puts a end
    a = "test2"
    f1 = fn -> IO.puts a end
    f0.()
    f1.()
  end

  def do_parallel(items, fun) do
    me = self
    items |> Enum.each(fn(e) ->
        spawn_link fn -> (send me, {self, fun.(e)}) end
      end
      )
  end

  def state do
    {:ok, pid} = Agent.start(fn -> 0 end)
    Agent.get(pid, &(&1))
    Agent.update(pid, &(&1+1))
    Agent.get(pid, &(&1))
  end

end

# |>
# Enum.each(fn(pid) ->
#   receive do {^pid, result} -> result end
# end)
