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
saveas(gcf, '..\latex\figures\subsonic_pressure_distributions.png')

trial = "supersonic"; % Sub- or super-sonic

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
saveas(gcf, '..\latex\figures\supersonic_pressure_distributions.png')

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
saveas(gcf, '..\latex\figures\subsonic_mach_distributions.png')
hold off
clear % Clear all variables.

%% Supersonic Theoretical and Experimental Data, Plots, and Uncertainties.

% Import data.
sup_pressure = get_pressures('supersonic');
error = get_uncertainties('supersonic');

% Initialize constants.
gamma = 1.4; % Ratio of specific heats.

sup_pressure(:,1)

% Get subsonic theoretical mach and uncertainties.
[sup_mach_thy, sup_mach_thy_err, sup_pressure_thy, sup_pressure_thy_err] = ...
    supersonic_theoretical(sup_pressure(:,1), error(:,1), gamma);

figure
plot(sup_pressure(1, :))
hold on
errorbar(sup_pressure_thy, sup_pressure_thy_err)
title('Experimental and Theoretical Pressure Comparison')
xlabel("Port Number")
ylabel("Pressure (Pa)")
legend('Experimental','Theoretical','Location','best')
saveas(gcf, '..\latex\figures\supersonic_pressure_distribution_exp_vs_thy.png')
hold off

% Get subsonic experimental mach and uncertainties.
sup_mach_exp = supersonic_experimental(sup_pressure, gamma);
sup_mach_exp_err = supersonic_experimental_err(sup_mach_exp, sup_pressure, error, gamma);

% Plot data
figure
errorbar(sup_mach_exp, sup_mach_exp_err)
hold on
errorbar(sup_mach_thy, sup_mach_thy_err)
title('Experimental and Theoretical Mach Comparison (Supersonic)')
xlabel("Port Number")
ylabel("Mach Number")
legend("Experimental", "Theoretical", "Location","best")
saveas(gcf, '..\latex\figures\supersonic_mach_distributions.png')
hold off 
%clear% Clear all variables.
