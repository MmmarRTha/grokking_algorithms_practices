defmodule SelectionSort do
  def sort_artists_by_play_count(artists) do
    selection_sort(artists, [])
  end

  defp selection_sort([], sorted), do: Enum.reverse(sorted)

  defp selection_sort(artists, sorted) do
    {max_artist, remaining_artists} = find_max_artist(artists)
    selection_sort(remaining_artists, [max_artist | sorted])
  end

  defp find_max_artist([artist]), do: {artist, []}

  defp find_max_artist([artist | rest]) do
    {max_artist, remaining_artists} = find_max_artist(rest)

    if artist[:play_count] > max_artist[:play_count] do
      {artist, [max_artist | remaining_artists]}
    else
      {max_artist, [artist | remaining_artists]}
    end
  end
end
