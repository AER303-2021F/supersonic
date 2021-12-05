function mach = supersonic_experimental(pressure, gamma)
    %{
    Return Mach numbers for the supersonic experimental case.

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
    total_pressure = pressure(2, :);
    
    % Prepare equation terms.
    t1 = total_pressure ./ static_pressure;
    t2 = (gamma + 1) / 2;
    t3 = gamma / (gamma - 1);
    t4 = 2 * gamma / (gamma + 1);
    t5 = (gamma - 1) / (gamma + 1);
    t6 = - 1 / (gamma - 1);
    
    % Define the Mach equation.
    fun = @(i, M) - t1(i) + ((t2 .* (M .^ 2)) .^ t3) .* ((t4 .* (M .^ 2) - t5) .^ t6);
    
    % Solve for the Mach numbers.
    temp_mach = zeros(1, 7);
    for i = 1:7
        f = @(M) fun(i, M);
        temp_mach(i) = fzero(f, 1.2);
    end
    
    mach = temp_mach;
end