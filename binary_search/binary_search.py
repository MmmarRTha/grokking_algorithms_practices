def binary_search(arr, item):
    low = 0
    high = len(arr) - 1
    
    while low <= high:
        mid = (low + high) // 2
        guess = arr[mid]
        
        if guess == item:
            return mid
        elif guess > item:
            high = mid - 1
        else:
            low = mid + 1
    return None

# Test the binary_search function
if __name__ == "__main__":
    arr = [1, 3, 5, 7, 9]
    item = 3
    result = binary_search(arr, item)
    print(f"Item {item} found at index: {result}")