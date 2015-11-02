defmodule ElixirSample.Random do

  def soft_immutability do
    a = "test"
    f0 = fn -> IO.puts a end
    a = "test2"
    f1 = fn -> IO.puts a end
    f0.()
    f1.()
  end

end
