function d_pressures = get_uncertainties(trial)
%{
returns the pressure uncertainties associated with a given experiment run

Parameters
----------
trial: str
    The trial of the experiment. Either "subsonic" or "supersonic"

Returns
-------
d_pressures: matrix (2, 7)
    Precision uncertainty of static and total pressures corresponding to each position.
    First row: Static port pressures
    Second row: Total pressures

Notes
-----
This function assumes that you are running code from the "code" folder,
otherwise the file paths will be messed up.

Calculation
-----------
Precision uncertainty = (standard deviation) / sqrt(N) * 1.96
%}

d_pressures = zeros(2, 7);

if trial == "subsonic"
    % Static Ports
    load("../data/raw_data/subsonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "Pstd", "numScans");
    d_pressures(1, :) = Pstd(1:7) / sqrt(numScans) * 1.96;
    
    % Total Ports
    for i = 1:7
        load(sprintf("../data/raw_data/subsonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "dataP_std", "numScans");
        d_pressures(2, i) = dataP_std(12) / sqrt(numScans) * 1.96;
    end
    
elseif trial == "supersonic"
    load("../data/raw_data/supersonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "Pstd", "numScans");
    d_pressures(1, :) = Pstd(1:7) / sqrt(numScans) * 1.96;
    
    for i = 1:7
        load(sprintf("../data/raw_data/supersonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "dataP_std", "numScans");
        d_pressures(2, i) = dataP_std(12) / sqrt(numScans) * 1.96;
    end
    
else
    error("Please type either 'subsonic' or 'supersonic' in your function call")
end

end