require "math"

local denominator = {}

local DENOMINATIONS = { 1, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000 }
local break_up, find_next_denom, init, payment, denom_index

function denominator.denom(price)
    init()
    if price > 0 then
        break_up(price)
    end
    return payment
end

function init()
    payment = {}
    denom_index = #DENOMINATIONS
end

function break_up(price)
    local current_denom = find_next_denom(price)
    payment[current_denom] = int_part

    local int_part, _ = math.modf(price / current_denom)
    local left_over = price - current_denom * int_part
    denominator.denom(left_over)
end

function find_next_denom(price)
    while denom_index > 1 and price < DENOMINATIONS[denom_index] do
        denom_index = denom_index - 1
    end
    return DENOMINATIONS[denom_index]
end

return denominator