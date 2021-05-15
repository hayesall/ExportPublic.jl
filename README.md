# ExportPublic.jl: Easily hide your implementation details

This is a fork of [`ExportAll.jl`](https://github.com/JKRT/ExportAll.jl/)
that helps you write modules with public and private methods.

If something starts with an underscore `_`, it will **not** be exported.

```julia
module SimpleMathExample
  using ExportPublic

  _secret_pi = 22/7                         # Private
  my_pi = _secret_pi                        # Public

  function add_squared(a::Int, b::Int)      # Public
    _squared(a) + _squared(b)
  end

  function _squared(a::Int)                 # Private
    a ^ 2
  end

  @exportPublic()                           # <--- Export our Public methods
end
```

The "*Public*" methods are automatically exported:

```julia
julia> include("SimpleMathExample.jl")
julia> using .SimpleMathExample
julia> add_squared(5, 5)
50
julia> my_pi
3.142857142857143
julia> _secret_pi
ERROR: UndefVarError: _secret_pi not defined
julia> _squared(5)
ERROR: UndefVarError: _squared not defined
```
