module SimpleMath
    using ExportPublic

    _secret_pi = 22/7
    my_pi = _secret_pi

    function add_two(a::Int, b::Int)
        _implementation_detail(a) + _implementation_detail(b)
    end

    function _implementation_detail(a::Int)
        a
    end

    function add_squared(a::Int, b::Int)
        _square_it(a) + _square_it(b)
    end

    function _square_it(a::Int)
        a ^ 2
    end

    @exportPublic()
end
