function [mach, mach_err, p, p_err] = supersonic_theoretical(pressure, pressure_err, gamma)
    %{
    Return Mach numbers for the supersonic theoretical case.

    Parameters
    ----------
    pressure : vector(2,1)
        Static and total pressures corresponding to port 1.
        First row: Static port pressures
        Second row: Total pressures
    pressure_err : vector (2, 7)
        Precision uncertainty of static and total pressures corresponding
        to Port 1.
        First row: Static port pressures
        Second row: Total pressures
    gamma : float
        Ratio of specific heats.
    
    Returns
    -------
    mach : matrix (1, 7)
        The Mach numbers for the input pressure data.
    p    : matrix (1, 7)
        The pressure for the theoretical data derived from the pressure at
        port 1
    err  : matrix (1, 7)
        error associated with all pressure values at each port
    %}
    area = [1.06 1 1.05 1.15 1.23 1.27 1.28];
    mach = zeros(1,7);
    mach_err = zeros(1,7);
    
    for i = 1:7
        f = @(M) 1/M * ( (2/(gamma + 1)) * ...
             (1 + (gamma - 1)/2 * M^2))^((gamma + 1)/ ...
             (2*(gamma - 1))) - area(i);
        if i == 2
            [mach(1,i), mach_err(1,i)]  = fzero(f, 1.1);
        else
            [mach(1,i), mach_err(1,i)]  = fzero(f, 1.2);
        end
        
    end
    [mach(1,1), mach_err(1,1)] = fzero(f, 0.8);
    
    %pressure relationship:
    p = zeros(1, 7);
    K = @(M)(1 + (gamma - 1)./2 .*M.^2).^(-gamma ./(gamma - 1));
    
    p(1, :) = pressure(2,1) * K(mach(1,:));
    
    S = @(M)-(2.*M.*gamma*(gamma./2 - 1./2))./(((gamma./2 - 1./2).*M.^2 + 1) ...
        .^(gamma./(gamma - 1) + 1).*(gamma - 1));

    p_err = sqrt((K(mach) .* pressure_err(2)).^2 + (S(mach) .* mach_err).^2);

end