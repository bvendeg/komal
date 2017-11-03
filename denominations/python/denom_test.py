__author__ = 'Balazs Vendeg'

import unittest
import denom


class DenominationTest(unittest.TestCase):
    def setUp(self):
        self._denominator = denom.Denominator()

    def test_nil(self):
        self.assertEqual(self._denominator.calc_min_denoms(0), [])

    def test_for_one_it_should_use_one_coin(self):
        self.assertEqual(self._denominator.calc_min_denoms(1), [(1, 1)])

    def test_for_two_it_should_use_two_coins(self):
        self.assertEqual(self._denominator.calc_min_denoms(1 + 1), [(1, 2)])

    def test_for_six_it_should_use_one_five_and_one_one_coin(self):
        self.assertEqual(self._denominator.calc_min_denoms(5 + 1), [(5, 1), (1, 1)])

    def test_large_number(self):
        self.assertEqual(self._denominator.calc_min_denoms(66970), [(20000, 3), (5000, 1), (1000, 1), (500, 1),
                                                                    (200, 2), (50, 1), (20, 1)])