import sys
import pytest

sys.path.append('./')

from addition import add_two_numbers


@pytest.mark.parametrize("input, expected_output", [
    ((1, 1), 2),
    ((-1, 5), 4),
    ((0, 0), 0),
    ((3.5, 4.5), 8),
])
def test_add_two_numbers(input, expected_output):
    assert add_two_numbers(*input) == expected_output