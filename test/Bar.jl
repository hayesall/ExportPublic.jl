module Bar
using ExportPublic

function foo()
  1
end

function bar()
  2
end

function barBar()
  3
end

function fooFoo()
    _secret_implementation_detail()
end

function _secret_implementation_detail()
    4
end

@exportPublic()
end
