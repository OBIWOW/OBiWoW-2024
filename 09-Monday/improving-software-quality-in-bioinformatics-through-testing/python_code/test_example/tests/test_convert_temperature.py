import sys
import pytest

from pandas.api.types import is_numeric_dtype

sys.path.append('./')

from convert_temperature import F_to_C, C_to_F


def test_F_to_C():
    temp_C = F_to_C(50)
    assert temp_C == 10
    assert is_numeric_dtype(type(temp_C))


def test_C_to_F():
    temp_F = C_to_F(10)
    assert temp_F == 50
    assert is_numeric_dtype(type(temp_F))


@pytest.mark.skip
def test_F_to_C_wrong():
    temp_C = F_to_C(50)
    assert temp_C == 2