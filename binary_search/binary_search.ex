defmodule BinarySearch do
    def search(list, target) do
        search(list, target, 0, length(list) - 1)
    end

    defp search(_list, _target, low, high) when low > high do
        :not_found
    end

    defp search(list, target, low, high) do
        mid = div(low + high, 2)
        guess = Enum.at(list, mid)

        cond do
            guess == target -> mid
            guess > target -> search(list, target, low, mid - 1)
            guess < target -> search(list, target, mid + 1, high)
        end
    end
end
