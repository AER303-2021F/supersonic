function [static, total] = get_time_series(trial)
%{
returns the full time series associated with a given experiment run

Parameters
----------
trial: str
    The trial of the experiment. Either "subsonic" or "supersonic"

Returns
-------
static: matrix (2500, 7)
    time series of static measurements @ 500 Hz

total: matrix (1000, 7)
    time series of total measurements @ 500 Hz
Notes
-----
This function assumes that you are running code from the "code" folder,
otherwise the file paths will be messed up.
%}

if trial == "subsonic"
    % Static Ports
    load("../data/raw_data/subsonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "dataP");
   	static = dataP(:, 1:7);
    
    total = zeros(1000, 7);
    
    % Total Ports
    for i = 1:7
        load(sprintf("../data/raw_data/subsonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "dataP");
        total(:, i) = dataP(:, 12);
    end  
    
elseif trial == "supersonic"
    load("../data/raw_data/supersonic/191028_Group1_StaticTapData_supersonic_7.mat"...
        , "dataP");
   	static = dataP(:, 1:7);
    
    total = zeros(1000, 7);
    
    for i = 1:7
        load(sprintf("../data/raw_data/supersonic/191028_Group1_TotalPressure_Port%d.mat", i)...
        , "dataP");
        total(:, i) = dataP(:, 12);
    end  
    
else
    error("Please type either 'subsonic' or 'supersonic' in your function call")
end

end