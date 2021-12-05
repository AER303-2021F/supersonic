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
sub_mach_exp_err = subsonic_experimental_err(sub_pressure, error);

% Get subsonic theoretical mach and uncertainties.
sub_mach_thy = subsonic_theoretical(sub_pressure, gamma);
sub_mach_thy_err = subsonic_theoretical_err(sub_pressure, error);

% Prepare data for plotting.
x = sub_mach_exp;
xneg = sub_mach_exp - sub_mach_exp_err;
xpos = sub_mach_exp + sub_mach_exp_err;

y = sub_mach_thy;
yneg = sub_mach_thy - sub_mach_thy_err;
ypos = sub_mach_thy + sub_mach_thy_err;

% Plot data
figure
errorbar(x, y, yneg, ypos, xneg, xpos)
title('Experimental and Theoretical Mach Comparison (Subsonic)')
xlabel('Theoretical Mach')
ylabel('Experimental Mach')

clear % Clear all variables.

%% Supersonic Theoretical and Experimental Data, Plots, and Uncertainties.

% Import data.
sup_pressure = get_pressures('supersonic');
error = get_uncertainties('supersonic');

% Initialize constants.
gamma = 1.4; % Ratio of specific heats.

% Get subsonic experimental mach and uncertainties.
sup_mach_exp = supersonic_experimental(sup_pressure, gamma);
sup_mach_exp_err = supersonic_experimental_err(sup_pressure, error);

% Get subsonic theoretical mach and uncertainties.
sup_mach_thy = supersonic_theoretical(sup_pressure, gamma);
sup_mach_thy_err = supersonic_theoretical_err(sup_pressure, error);

% Prepare data for plotting.
x = sup_mach_exp;
xneg = sup_mach_exp - sup_mach_exp_err;
xpos = sup_mach_exp + sup_mach_exp_err;

y = sup_mach_thy;
yneg = sup_mach_thy - sup_mach_thy_err;
ypos = sup_mach_thy + sup_mach_thy_err;

% Plot data
figure
errorbar(x, y, yneg, ypos, xneg, xpos)
title('Experimental and Theoretical Mach Comparison (Supersonic)')
xlabel('Theoretical Mach')
ylabel('Experimental Mach')

clear % Clear all variables.
