function [TimeTable] = TimeTabler(subjects, unchangeables)
% TIMETABLER Writes a timetable for a student (me) with n (n<10) classes and on a m day
% schedule. All subjects are given even amount of timeslots.
% INPUTS
%   subjects: a collumn string array of 5 letter subject codes the student is taking
%             (highest priority at the top)
%   unchangables: a matrix (n by timeslots) of unchangeable timeslots, this should include
%   indicies: (1) : DO NOT FILL, (2i) : lecture of i subject, (3i) : for
%   labs of tutorials. 
% OUTPUT
%   TimeTable: a matrix (n by timeslots) conataining relevant intergers of indexs
%           subjects
%
% AUTHOR: Alex Skilton


%% Set up variables and timetable
% Define the number of days and time slots in your study schedule
numDays = 5;           % Number of days in a week
numTimeSlots = 8;      % Number of time slots per day

% Intialise arrays
studySchedule = false(numDays, numTimeSlots);
TimeTable = repmat("", numDays, numTimeSlots);
visualiseSchedule = ones(numDays, numTimeSlots);

% Create counters
subcount = zeros(length(subjects), 1);

%% Allocate study time for least used subject/topic
while sum(studySchedule, 'all') ~= numTimeSlots * numDays
    %% Select subject

    % Choose subject with lowest hours
    [~ , i] = min(subcount);
    subject = string(subjects{i(1)});

    % Find an empty slot for the subject/topic
    [day, timeSlot] = find(studySchedule == false, 1);
    
    % Check if study of single subject is longer than 2 hours
    if timeSlot > 2
        if strcmp(subject, TimeTable(day, (timeSlot - 1))) && strcmp(subject, TimeTable(day, (timeSlot - 2)))
            [~, index] = sort(subcount, 'ascend');
            i = index(2);
            subject = string(subjects{i(1)});           
        end
    end
        %% Check for conflicts or constraints and adjust if necessary
        % Check unchangables for set values
        % locate value
        unchangeValue = unchangeables(day, timeSlot);

        % Find type
        if unchangeValue >= 1
            switch true 
                case unchangeValue == 1
                    subject = "-";
                case unchangeValue > 20 && unchangeValue < 30
                    type = "Lec";
                    x = unchangeValue - 20; % Calculate subject code
                    subject = subjects{x}; % Convert to string
                otherwise %unchangevalue > 30
                    type = "Lab";
                    x = unchangeValue - 30; % Calculate subject code
                    subject = subjects{x}; % Convert to string
            end
        end


        % Create time counter for each subject
        % Find subject
        switch true
            case strncmpi(subject, subjects{1}, 5)
                subcount(1) = subcount(1) + 1; % add 1 to counter
                % Set colour of element
                visualiseSchedule(day, timeSlot) = 0.1;

            case strncmpi(subject, subjects{2}, 5)
                subcount(2) = subcount(2) + 1; % add 1 to counter
                % Set colour of element
                visualiseSchedule(day, timeSlot) = 0.3;

            case strncmpi(subject, subjects{3}, 5)
                subcount(3) = subcount(3) + 1; % add 1 to counter
                % Set colour of element
                visualiseSchedule(day, timeSlot) = 0.5;

            case strncmpi(subject, subjects{4}, 5)
                subcount(4) = subcount(4) + 1; % add 1 to counter
                % Set colour of element
                visualiseSchedule(day, timeSlot) = 0.7;
              
            otherwise
                % Set colour of element to 1
                visualiseSchedule(day, timeSlot) = 1;
        end

        % Check if array is not unchangeable or a free period
        if unchangeValue <= 1 
            % do nothing
        else % Must be unchangable 
            subject = sprintf("%s - %s", subject, type);
        end
        % Update the study schedule
        TimeTable(day, timeSlot) = subject;
        studySchedule(day, timeSlot) = true;
end

% Transpose into my prefered reading format
TimeTable = transpose(TimeTable);
visualiseSchedule = transpose(visualiseSchedule);

% Visualization (Optional)
Visual = input("Would you like a visualisation of your timetable? (y/n)", 's');
if strcmpi(Visual, 'y') == true
    % Use Function
    VisualiseTimeTable(visualiseSchedule, subjects)
end

% Save the study schedule as a CSV file
TimeTable2CSV("study_schedule.csv", TimeTable)
end