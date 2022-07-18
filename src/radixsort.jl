function maxbit(array::Vector{T}) where T <: Integer
  n = length(array)
  maxdata = maximum(array)
  
  d, p = 1, 10
  while maxdata >= p
    maxdata /= 10
    d += 1
  end

  return d
end

function radixsort!(array::Vector{T}) where T <: Integer
  isempty(array) && return

  n = length(array)
  d = maxbit(array)
  temparray = Vector{T}(undef, n)
  count = Vector{T}(undef, 10)
  
  radix = 1

  for _ in 1:d
    for index in 1:10
      count[index] = 0
    end

    for index in 1:n
      k = floor(Int, (array[index] / radix) % 10) + 1
      count[k] += 1
    end

    for index in 2:10
      count[index] = count[index - 1] + count[index]
    end

    for index in n:-1:1
      k = floor(Int, (array[index] / radix) % 10) + 1
      temparray[count[k]] = array[index]
      count[k] -= 1
    end

    for index in 1:n
      array[index] = temparray[index]
    end
    
    radix *= 10
  end
end