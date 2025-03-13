defmodule RecursiveMax do
  def max([]), do: raise("Sorry, cannot find the maximum of an empty list")
  def max([single]), do: single

  def max([head | tail]) do
    max_of_tail = max(tail)
    if head > max_of_tail, do: head, else: max_of_tail
  end
end
