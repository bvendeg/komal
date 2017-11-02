require "busted"
local denominator = require "denomination"

describe("Denomination calculator", function()

    local expected

    before_each(function()
        expected = {}
    end)

    it("should return with empty list for 0", function()
        assert.are.Same({}, denominator.denom(0))
    end)

    it("should return with one coin for one", function()
        expected = { [1] = 1 }
        assert.are.Same(expected, denominator.denom(1))
    end)

    it("should break up six for five plus one", function()
        expected = { [1] = 1, [5] = 1 }
        assert.are.Same(expected, denominator.denom(5 + 1))
    end)

    it("should break up three for three coins", function()
        expected = { [1] = 3 }
        assert.are.Same(expected, denominator.denom(3))
    end)

    it("should break up five as just five", function()
        expected = { [5] = 1 }
        assert.are.Same(expected, denominator.denom(5))
    end)

    it("should break up large numbers as well", function()
        expected[20] = 1
        expected[50] = 1
        expected[200] = 2
        expected[500] = 1
        expected[1000] = 1
        expected[5000] = 1
        expected[20000] = 3
        assert.are.Same(expected, denominator.denom(66970))
    end)
end)
