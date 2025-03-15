defmodule PriceOfGroceries do
  book =
    %{}
    |> Map.put("apple", 0.67)
    |> Map.put("milk", 1.49)
    |> Map.put("avocado", 1.49)
    |> Map.put("egg", 3.00)

  IO.inspect(book)
end
