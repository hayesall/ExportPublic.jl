module ExportPublicTest

    using Test
    include("Bar.jl")
    using .Bar
    include("SimpleMath.jl")
    using .SimpleMath
    include("DemoModule.jl")
    using .DemoModule

    @testset "Bar.jl" begin
        @test foo() == 1
        @test bar() == 2
        @test barBar() == 3
        @test fooFoo() == 4
        @test_throws UndefVarError _secret_implementation_detail()
    end

    @testset "SimpleMath.jl" begin
        @test add_two(5, 5) == 10
        @test add_two(10, 10) == 20
        @test_throws UndefVarError _implementation_detail()
        @test add_squared(1, 1) == 2
        @test add_squared(2, 2) == 8
        @test add_squared(4, 4) == 32
        @test_throws UndefVarError _square_it()
        @test my_pi == 22/7
        @test_throws UndefVarError _secret_pi
    end

    @testset "DemoModule.jl" begin
        @test add(5, 5) == 10
        @test add(6, 6) == 12
        @test_throws UndefVarError _private_helper()
    end
end
