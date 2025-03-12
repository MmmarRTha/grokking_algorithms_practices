defmodule Countdown do
  @doc """
  Counts down from the given number to 1.

  ## Examples
      iex> Countdown.countdown(3)
      3
      2
      1
      "Blastoff!"
  """
  def countdown(0) do
    "Blastoff!"
  end

  def countdown(n) when n > 0 do
    IO.puts(n)
    countdown(n - 1)
  end

  @doc """
  Entry point to run the countdown from 3.
  """
  def run do
    countdown(3)
  end
end
