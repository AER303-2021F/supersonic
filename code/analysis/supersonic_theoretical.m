function mach = supersonic_theoretical(pressure)
    %{
    Return Mach numbers for the supersonic theoretical case.

    Parameters
    ----------
    pressures : matrix (2, 7)
        Static and total pressures corresponding to each position.
        First row: Static port pressures
        Second row: Total pressures

    Returns
    -------
    mach : matrix (1, 7)
        The Mach numbers for the input pressure data.
    %}
    
    mach = zeros(1,7);
end