%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN THIS CODE FROM THE /code FOLDER                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Setup Code for Preprocessing Work

addpath('preprocessing')

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

clear % Clear all variables.

%% Setup Code for Analysis Work

% Add analysis code directory to MATLAB search path.
addpath('analysis')

%% Subsonic Theoretical and Experimental Data, Plots, and Uncertainties.

% Import data.
sub_pressure = get_pressures('subsonic');
error = get_uncertainties('subsonic');

% Initialize constants.
gamma = 1.4; % Ratio of specific heats.

% Get subsonic experimental mach and uncertainties.
sub_mach_exp = subsonic_experimental(sub_pressure, gamma);
sub_mach_exp_err = subsonic_experimental_err(sub_pressure, error, gamma);

% Get subsonic theoretical mach and uncertainties.
[sub_mach_thy, sub_mach_thy_err] = ...
    subsonic_theoretical(sub_pressure, error, gamma);

% Plot data
figure
errorbar(sub_mach_exp, sub_mach_exp_err)
hold on
errorbar(sub_mach_thy, sub_mach_thy_err)

title('Experimental and Theoretical Mach Comparison (Subsonic)')
xlabel("Port Number")
ylabel("Mach Number")
legend("Experimental", "Theoretical")

clear % Clear all variables.

%% Supersonic Theoretical and Experimental Data, Plots, and Uncertainties.

% Import data.
sup_pressure = get_pressures('supersonic');
error = get_uncertainties('supersonic');

% Initialize constants.
gamma = 1.4; % Ratio of specific heats.

% Get subsonic experimental mach and uncertainties.
[sup_mach_exp, sup_mach_exp_err] = supersonic_experimental( gamma, error);

% Get subsonic theoretical mach and uncertainties.
sup_mach_thy = supersonic_theoretical(sup_pressure, gamma);
sup_mach_thy_err = supersonic_theoretical_err(sup_pressure, error, gamma);


% Plot data
figure
errorbar(sup_mach_exp, sup_mach_exp_err)
hold on
errorbar(sup_mach_thy, sup_mach_thy_err)

title('Experimental and Theoretical Mach Comparison (Supersonic)')
xlabel("Port Number")
ylabel("Mach Number")
legend("Experimental", "Theoretical")

clear % Clear all variables.
