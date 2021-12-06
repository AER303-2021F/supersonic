function error = supersonic_experimental_err(mach, pressure, pressure_err, gamma)
    %{
    Return uncertainty for the suppersonic experimental Mach numbers.

    Parameters
    ----------
    mach : matrix (1, 7)
        The Mach numbers.
    pressure : matrix (2, 7)
        Static and total pressures corresponding to each position.
        First row: Static port pressures
        Second row: Total pressures
    pressure_err : matrix (2, 7)
        Precision uncertainty of static and total pressures corresponding
        to each position.
        First row: Static port pressures
        Second row: Total pressures
    gamma : float
        Ratio of specific heats.

    Returns
    -------
    error : matrix (1, 7)
        The Mach number uncertainties.
    %}

    % Prepare data.
    static_pressure = pressure(1, :);
    total_pressure = pressure(2, :);
    
    static_pressure_err = pressure_err(1, :);
    total_pressure_err = pressure_err(2, :);
    
    % Get total and static pressure partial.
    total_partial = 1 ./ static_pressure;
    static_partial = - total_pressure ./ (static_pressure .^ 2);
    
    % Get the Mach partial.
    t1 = (gamma / (gamma - 1));
    t2 = (0.5 .* (mach .^ 2) .* (gamma + 1)) .^ (1 / (gamma - 1));
    t3 = ((gamma + 1) .* mach);
    t4 = ((2 * gamma / (gamma + 1)) .* mach .^ 2 - (gamma - 1) / (gamma + 1)) .^ (- 1 / (gamma - 1));
    t5 = (1 / (gamma - 1));
    t6 = (((2 * gamma / (gamma + 1)) .* mach .^ 2 - (gamma - 1) / (gamma + 1)) .^ (- (1 / (gamma - 1)) - 1));
    t7 = (4 * gamma .* mach / (gamma + 1));
    t8 = (0.5 * mach .^ 2 * (gamma + 1)) .^ (gamma / (gamma - 1));
    
    mach_partial = t1 .* t2 .* t3 .* t4 - t5 .* t6 .* t7 .* t8;
    
    mach_err = sqrt((total_partial .* total_pressure_err) .^ 2 + (static_partial .* static_pressure_err) .^ 2) ./ mach_partial;
    error = mach_err .* mach;
end