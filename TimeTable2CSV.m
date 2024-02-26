function [] = TimeTable2CSV(fileName, schedule)
%TimeTable2CSV Outputs a given schedule(n by m string array) to a csv file
% INPUTS
%   fileName: Name of file to be written to.
%   schedule: n by m string array holding timetable information
% OUTPUTS:
%   a named csv file containing timetable data
%
% AUTHOR: Alex Skilton

% Open fileName with writing permissions
fileID = fopen(fileName, 'w');

fprintf(fileID, " ,");
for c = 1:(size(schedule, 2)-1)
    fprintf(fileID, "Day %s, ", num2str(c));
end
    fprintf(fileID, "Day %i\n", c+1);

% Iterate across fileName array
for r = 1:size(schedule, 1)
    fprintf(fileID, "Slot %s, ", num2str(r));
    for c = 1:(size(schedule, 2)-1)
        fprintf(fileID, "%s, ", schedule(r, c));
    end
    fprintf(fileID, "%s\n", schedule(r, c+1));
end

% Close File
fclose(fileID);
end