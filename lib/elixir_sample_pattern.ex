defmodule ElixirSample.Pattern do
  def sum(numbers), do: sum(numbers, 0)

  def sum([], acc), do: IO.puts acc

  def sum(numbers, acc) do
    [head | tail] = numbers
    sum(tail, acc + head)
  end

end
