defmodule Greet do
  def greet2(name) do
    IO.puts("how are you, #{name}?")
  end

  def bye, do: IO.puts("ok, bye!")

  def greet(name) do
    IO.puts("hello, #{name}!")
    greet2(name)
    IO.puts("see you later, #{name}!")
    bye()
  end
end
