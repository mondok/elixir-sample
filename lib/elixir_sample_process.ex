defmodule ElixirSample.Process do
  def hello do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
      hello
    end
  end
end

defmodule ElixirSample.Process.Sender do
  def go do
    pid = spawn(ElixirSample.Process, :hello, [])
    send pid, {self, "Mike!"}
    receive do
      {:ok, message} ->
        IO.puts message
    end
  end
end
