module DemoModule
    using ExportPublic

    function add(a, b)
        # `add` is exported automatically
        return _private_helper(a) + _private_helper(b)
    end

    function _private_helper(a)
        # `_private_helper` should not be exported, so it's marked with a `_`
        return a
    end

    @exportPublic()
end
