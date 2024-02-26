function [] = VisualiseTimeTable(visualiseSchedule, subjects)
% VISUALISETIMETABLE Creates a visualisation of a given timetable
%   INPUTS:
%       visualiseSchedule: a n-by-m matrix of the timetable to be
%                          visualised
%       subjects: A collumn vector of subjects
%   OUTPUT:
%       Create a figure showing different colours for each timetable.
%
% AUTHOR: Alex Skilton

% Generate random colours
colours = (randi(255, [(length(subjects)), 3]) - 1) / 255;
colours((length(subjects))+1, 1:3) = [0 0 0];
% Create figure 1
figure();

colormap(colours); % Define colors
imagesc(visualiseSchedule); % Show scaled image

% Set grid ticks to 1 unit spacing
set(gca, 'XTick', 1:1:size(visualiseSchedule, 2))

% Labels
title('Study Schedule');
xlabel('Day');
ylabel('TimeSlot');
end