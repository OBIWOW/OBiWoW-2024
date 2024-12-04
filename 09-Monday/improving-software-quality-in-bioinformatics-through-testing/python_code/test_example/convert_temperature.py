def F_to_C(
    F_temp: float,
) -> float:
    
    C_temp = (F_temp - 32) * 5/9
    return C_temp


def C_to_F(
    C_temp: float,
) -> float:

    F_temp = (C_temp * 9/5) + 32
    return F_temp