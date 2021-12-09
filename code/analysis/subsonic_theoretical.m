function [mach, mach_err, p, p_err] = subsonic_theoretical(pressure, pressure_err, gamma)
    %{
    Return Mach numbers for the subonic theoretical case.\

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
    mach : matrix (1, 7)
        The Mach numbers for the input pressure data.
    mach_err : matrix (1, 7)
        The Mach number uncertainties.
    p : matrix (1, 7)
        The pressure for the theoretical data derived from the pressure at
        port 1
    p_err : matrix(1, 7)
        Uncertainties associated with the pressures.

    Notes
    -----
    Uses only a single port's pressures for calculations.
    %}
    
    %Givens
    rho = 1.225;  % density of air, kg/m^3
    A = [1.06, 1, 1.05, 1.15, 1.23, 1.27, 1.28, 1.3, 1.3, 1.3];
    % Area ratios, from lab document
    
    i_ref = 1; % Using port 1 as reference
    
    % Reference experimental pressures
    P_o = pressure(2, i_ref);  % Total pressure, assumed constant
    dP_o = pressure_err(2, i_ref);
    P_1 = pressure(1, i_ref);
    dP_1 = pressure_err(1, i_ref);
    
    % Flow velocity at reference port
    U_1 = sqrt(2 * (P_o - P_1)/rho); 
    dU_1 = 1/(U_1 * rho) * sqrt(dP_o^2 + dP_1^2);
    
    i = 1:7; % vectorized indices for each port
    
    % Calculate Velocity using continuity
    U_2 = A(i_ref)./A(i) .* U_1;
    dU_2 =  A(i_ref)./A(i) .* dU_1;

    % Calculate Pressure using incompressible Bernoulli
    P_2 = P_o - 1/2 .* rho .* U_2.^2;
    dP_2 = sqrt(dP_o^2 +  (rho * U_2 .* dU_2).^2);

    % Calculate local speed of sound
    a = sqrt(gamma * P_2./rho);
    da = gamma ./ (2 * a * rho) .* dP_2;
    
    % Calculate mach number at each port
    mach = U_2 ./ a;
    mach_err = sqrt((1./a .* dU_2).^2 + (U_2 ./ a.^2 .* da).^2);
    
    p = P_2;
    p_err = dP_2;
end