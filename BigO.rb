def octopus_bubble_sort(arr)
  swapped = false
  until swapped
    swapped = true
    i = 0
    while i < arr.length - 1
      num = arr[i].length <=> arr[i + 1].length
      if num == 1
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = false
      end
      i += 1
    end
  end
  arr.last
end
  
  
def dominant_octopus(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  duplicate = arr.dup
  left = dominant_octopus(duplicate.take(mid))
  right = dominant_octopus(duplicate.drop(mid))

  merge_sort(left, right)
  
end

def merge_sort(left, right)
  result = []
  until left.empty? || right.empty?
    num = left[0].length <=> right[0].length
    if num == -1
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

def clever_octopus(arr)
  longest_fish = ""

  arr.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  return longest_fish
end

def slow_dance(direction, tiles_array)
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

    tiles_array.each_with_index do |tile, idx|
      return idx if tile == direction
    end
    idx
end

def constant_dance(direction, tiles_hash)
  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

  return tiles_hash[direction]
end


