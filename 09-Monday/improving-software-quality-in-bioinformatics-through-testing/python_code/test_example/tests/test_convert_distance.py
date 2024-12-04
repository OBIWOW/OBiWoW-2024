import sys
import pytest

sys.path.append('./')

from convert_distance import meters2feet


def test_meters2feet():
    # Test case 1: atempting to convert a character
    with pytest.raises(ValueError) as e_info:
        meters2feet('a')

    # Test case 2: handling zero conversion 
    assert meters2feet(0) == 0