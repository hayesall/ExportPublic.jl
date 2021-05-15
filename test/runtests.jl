module ExportPublicTest
  using Test
  include("Bar.jl")
  using .Bar
  using ExportPublic
@testset "Export test" begin
  @test foo() == 1
  @test bar() == 2
  @test barBar() == 3
end
end
