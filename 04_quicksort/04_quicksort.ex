defmodule Quicksort do
  def sort(list) when length(list) < 2, do: list

  def sort([pivot | tail]) do
    {less, greater} = Enum.split_with(tail, &(&1 <= pivot))
    sort(less) ++ [pivot | sort(greater)]
  end
end
