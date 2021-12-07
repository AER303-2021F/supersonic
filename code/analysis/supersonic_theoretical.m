function [mach, err] = supersonic_theoretical(gamma)
    %{
    Return Mach numbers for the supersonic theoretical case.

    Parameters
    ----------
    pressures : matrix (2, 7)
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
    area = [1.06 1 1.05 1.15 1.23 1.27 1.28];
    mach = zeros(1,7);
    for i = 1:7
        f = @(M) 1/M * ( (2/(gamma + 1)) * ...
                (1 + (gamma - 1)/2 * M^2))^((gamma + 1)/ ...
                (2*(gamma - 1))) - area(i);
        if i == 1
            mach(1,i)  = fzero(f, 0.9);
        else
            mach(1,i)  = fzero(f, 1.2);
        end 
        %right now port 1 is garbo
    end
    
    
end