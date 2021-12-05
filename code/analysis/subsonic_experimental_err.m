function error = subsonic_experimental_err(pressure, pressure_err, gamma)
    %{
    Return uncertainty for the subsonic experimental Mach numbers.

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
    
    % Prepare terms for total pressure partial.
    t1 = static_pressure .^ ((1 - gamma) / (2 * gamma));
    t2 = total_pressure .^ (- 1 / gamma);
    t3 = sqrt(gamma - 1);
    
    num = t1 .* t2 .* t3;
    
    t4 = gamma * sqrt(2);
    t5 = - static_pressure .^ ((gamma - 1) / gamma);
    t6 = total_pressure .^ ((gamma - 1) / gamma);
    
    denom = t4 .* sqrt(t5 + t6);
    
    % Get total pressure partial.
    total_partial = num ./ denom;
    
    % Prepare terms for static pressure partial.
    t1 = static_pressure .^ ((1 - 3 * gamma) / (2 * gamma));
    t2 = total_pressure .^ ((gamma - 1) / gamma);
    t3 = sqrt(gamma - 1);
    
    num = t1 .* t2 .* t3;
    
    t4 = gamma * sqrt(2);
    t5 = - static_pressure .^ ((gamma - 1) / gamma);
    t6 = total_pressure .^ ((gamma - 1) / gamma);
    
    denom = t4 .* sqrt(t5 + t6);
    
    % Get static pressure partial.
    static_partial = num ./ denom;
    
    % Calculate Mach uncertainty.
    term_1 = (total_partial .* total_pressure_err) .^ 2;
    term_2 = (static_partial .* static_pressure_err) .^ 2;
    error = sqrt(term_1 + term_2);
end