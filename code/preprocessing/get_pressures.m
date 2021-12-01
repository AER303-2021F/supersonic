function pressures = get_pressures(trial)
%{
returns the pressures associated with a given experiment run

Parameters
----------
trial: str
    The trial of the experiment. Either "subsonic" or "supersonic"

Returns
-------
pressures: matrix (2, 7)
    Static and total pressures corresponding to each position.
    First row: Static port pressures
    Second row: Total pressures

Notes
-----
This function assumes that you are running code from the "code" folder,
otherwise the file paths will be messed up.
%}

pressures = zeros(2, 7);

if trial == "subsonic"
    % Static Ports
    load("../data/raw_data/subsonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "Pmean");
    pressures(1, :) = Pmean(1:7);
    
    % Total Ports
    for i = 1:7
        load(sprintf("../data/raw_data/subsonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "totalP");
        pressures(2, i) = totalP;
    end  
    
elseif trial == "supersonic"
    load("../data/raw_data/supersonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "Pmean");
    pressures(1, :) = Pmean(1:7);
    
    for i = 1:7
        load(sprintf("../data/raw_data/supersonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "totalP");
        pressures(2, i) = totalP;
    end  
    
else
    error("Please type either 'subsonic' or 'supersonic' in your function call")
end

end