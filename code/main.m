% RUN THIS CODE FROM THE /code FOLDER
addpath(genpath('preprocessing'))

%% Plot Raw Pressures and Uncertainties
trial = "subsonic"; % Sub- or super-sonic

pressures = get_pressures(trial);
uncertainties = get_uncertainties(trial);

figure
errorbar(pressures(1,:), uncertainties(1,:))
hold on
errorbar(pressures(2,:), uncertainties(2,:))
xlabel("Port Number")
ylabel("Pressure (Pa)")
legend("Static Pressure", "Total Pressure")
title(sprintf("Pressures for %s Experiment", trial));