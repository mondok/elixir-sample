defmodule ElixirSample.Node do
  def connect(node_id) do
    Node.connect node_id
  end
end

# iex --sname node1
# iex --sname node2

# Node.list
# Node.connect :"something"
#
# func = fn -> IO.inspect Node.self end
#
# spawn(func)
#
# Node.spawn(:"sdfd", func)
