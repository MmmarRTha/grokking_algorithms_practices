defmodule RecursiveCount do
  def count([]), do: 0

  def count([_head | tail]) do
    1 + count(tail)
  end
end
