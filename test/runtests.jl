using Sorting, Test

@testset "test radix sort" begin
  nums = rand(1:100, 100)
  sorted = sort(nums)

  radixsort!(nums)
  @test nums == sorted
  
end