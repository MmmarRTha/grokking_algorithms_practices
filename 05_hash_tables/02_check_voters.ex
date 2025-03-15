defmodule CheckVoters do
  def check_voters(voters_map, name) do
    if Map.has_key?(voters_map, name) do
      IO.puts("Kick them out!")
      voters_map
    else
      IO.puts("Let them vote!")
      Map.put(voters_map, name, true)
    end
  end

  def run do
    IO.puts("Welcome to the Voting System!")
    IO.puts("Type 'exit' to quit the program.")

    loop_voters(%{})
  end

  def loop_voters(voters_map) do
    IO.write("Enter voter name: ")
    input = IO.gets("") |> String.trim()

    case input do
      "exit" ->
        IO.puts("Exiting voting system. Final voter list:")
        IO.inspect(voters_map)

      name ->
        updated_map = check_voters(voters_map, name)
        loop_voters(updated_map)
    end
  end
end

CheckVoters.run()
