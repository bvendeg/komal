__author__ = 'Balazs Vendeg'

# Homework: change the solution to be tail recursive


class Denominator(object):
    def __init__(self):
        self._DENOMINATIONS = [20000, 10000, 5000, 2000, 1000, 500, 200, 100, 50, 20, 10, 5, 1]
        self._price = 0

    def calc_min_denoms(self, price):
        self._price = price
        payment = []
        if self._price > 0:
            denomination, multiplicity = self.find_largest_denom()
            leftover = self._price - denomination * multiplicity
            payment = [(denomination, multiplicity)] + self.calc_min_denoms(leftover)
        return payment

    def find_largest_denom(self):
        denom_index = -1
        int_part = 0
        while int_part <= 0:
            denom_index += 1
            int_part = self._price / self._DENOMINATIONS[denom_index]
        return self._DENOMINATIONS[denom_index], int_part
