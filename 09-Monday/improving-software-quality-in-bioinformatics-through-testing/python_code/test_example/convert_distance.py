from pandas.api.types import is_numeric_dtype

def meters2feet(
    x: float,       
) -> float:

    if not is_numeric_dtype(type(x)):
        raise ValueError('The distance must be a number.') 
    
    if (x < 0):
        raise ValueError('The distance must be a non-negative number.')
    
    return 3.28084 * x