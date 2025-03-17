defmodule BreadthFirstSearch do
  @moduledoc """
  Implements breadth-first search algorithm to find a mango seller in a social network.
  """

  @type graph :: %{String.t() => [String.t()]}
  @type search_fn :: (String.t() -> boolean())

  @doc """
  Searches for a mango seller in the given graph starting from start_person.
  Returns {:ok, person} if found, :error otherwise.

  ## Examples

    iex> graph = %{"you" => ["alice", "bob"], "bob" => ["thom"]}
    iex> is_seller? = &String.ends_with?(&1, "m")
    iex> BreadthFirstSearch.find_mango_seller(graph, "you", is_seller?)
    {:ok, "thom"}
  """

  @spec find_mango_seller(graph, String.t(), search_fn) :: {:ok, String.t()} | :error
  def find_mango_seller(graph, start_person, is_mango_seller?) do
    if is_mango_seller?.(start_person) do
      {:ok, start_person}
    else
      queue = :queue.from_list([start_person])
      visited = MapSet.new([start_person])

      bfs(graph, queue, visited, is_mango_seller?)
    end
  end

  @doc """
  Core BFS algorithm implementation.
  Recursively processes the queue until either a mango seller is found or the queue is empty.
  """
  defp bfs(_graph, {:empty, _}, _visited, _is_mango_seller?), do: :error

  defp bfs(graph, queue, visited, is_mango_seller?) do
    case :queue.out(queue) do
      {:empty, _} ->
        :error

      {{:value, person}, new_queue} ->
        neighbors = Map.get(graph, person, [])

        case process_neighbors(neighbors, new_queue, visited, is_mango_seller?) do
          {:found, mango_seller} ->
            {:ok, mango_seller}

          {next_queue, next_visited} ->
            bfs(graph, next_queue, next_visited, is_mango_seller?)
        end
    end
  end

  @doc """
  Processes all neighbors of the current person.
  """
  defp process_neighbors(neighbors, queue, visited, is_mango_seller?) do
    Enum.reduce_while(neighbors, {queue, visited}, fn neighbor, {acc_queue, acc_visited} ->
      cond do
        MapSet.member?(acc_visited, neighbor) ->
          {:cont, {acc_queue, acc_visited}}

        is_mango_seller?.(neighbor) ->
          {:halt, {:found, neighbor}}

        true ->
          new_queue = :queue.in(neighbor, acc_queue)
          new_visited = MapSet.put(acc_visited, neighbor)
          {:cont, {new_queue, new_visited}}
      end
    end)
  end
end

graph = %{
  "you" => ["alice", "bob", "claire"],
  "bob" => ["anuj", "peggy"],
  "alice" => ["peggy"],
  "claire" => ["thom", "jonny"],
  "anuj" => [],
  "peggy" => [],
  "thom" => [],
  "jonny" => []
}

is_mango_seller? = &String.ends_with?(&1, "m")

case BreadthFirstSearch.find_mango_seller(graph, "you", is_mango_seller?) do
  {:ok, person} -> IO.puts("#{person} is a mango seller!")
  :error -> IO.puts("No mango seller found!")
end
