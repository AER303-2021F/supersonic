

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot area-Mach number relation %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gamma = 1.4;
M = linspace(0.05, 4, 1000);
a = (1 ./ M) .* ((2 ./ (gamma + 1)) .* (1 + (gamma - 1) .* M .^ 2 ./ 2)) .^ ((gamma + 1) ./ (2 .* (gamma - 1)));

plot(a, M);
title('Area-Mach Number Relation');
xlabel('$A/A^*$', 'interpreter', 'latex');
ylabel('$M$', 'interpreter', 'latex');
grid on
set(gca, 'FontSize', 15)
saveas(gcf, '..\..\latex\figures\area_mach_relation.png')

