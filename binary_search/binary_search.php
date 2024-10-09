<?php
function binarySearch(array $arr, int $target): int {
    $low = 0;
    $high = count($arr) - 1;

    while ($low <= $high) {
        $mid = intdiv($low + $high, 2);
        $guess = $arr[$mid];

        if ($guess == $target) {
            return $mid;
        } elseif ($guess > $target) {
            $high = $mid - 1;
        } else {
            $low = $mid + 1;
        }
    }

    return -1; // Target not found
}

// Example usage
$arr = [1, 3, 5, 7, 9, 11];
$target = 7;
$result = binarySearch($arr, $target);

if ($result != -1) {
    echo "Element found at index: " . $result;
} else {
    echo "Element not found in the array.";
}
?>