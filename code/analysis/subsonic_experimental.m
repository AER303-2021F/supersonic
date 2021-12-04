function mach = subsonic_experimental(pressure, gamma)
    %{
    Return Mach numbers for the subonic experimental case.

    Parameters
    ----------
    pressure : matrix (2, 7)
        Static and total pressures corresponding to each position.
        First row: Static port pressures
        Second row: Total pressures
    gamma : float
        Ratio of specific heats.

    Returns
    -------
    mach : matrix (1, 7)
        The Mach numbers for the input pressure data.
    %}
    
    % Prepare data.
    static_pressure = pressure(1, :);
    tot_pressure = pressure(2, :);
    
    % Prepare equation terms.
    term_1 = 2 / (gamma - 1);
    term_2 = (gamma - 1) / gamma;
    
    % Calculate Mach.
    mach_squared = term_1 .* ((tot_pressure ./ static_pressure) .^ term_2 - 1);
    mach = sqrt(mach_squared);
end