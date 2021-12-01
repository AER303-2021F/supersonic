% RUN THIS CODE FROM THE /code FOLDER
addpath(genpath('preprocessing'))

pressures = get_pressures("supersonic");
[static_series, total_series] = get_time_series("subsonic");