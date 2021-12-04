function error = subsonic_theoretical_err(pressure, pressure_err)
    %{
    Return uncertainty for the subsonic theoretical Mach numbers.

    Parameters
    ----------
    pressure : matrix (2, 7)
        Static and total pressures corresponding to each position.
        First row: Static port pressures
        Second row: Total pressures
    pressure_err : matrix (2, 7)
        Precision uncertainty of static and total pressures corresponding
        to each position.
        First row: Static port pressures
        Second row: Total pressures

    Returns
    -------
    error : matrix (1, 7)
        The Mach number uncertainties.
    %}

    error = zeros(1, 7);
end