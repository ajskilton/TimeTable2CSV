% Define the number of days and time slots in your study schedule
numDays = 7;           % Number of days in a week
numTimeSlots = 4;      % Number of time slots per day

% Create a study schedule matrix with zeros
studySchedule = zeros(numDays, numTimeSlots);

% Input subject/topic data
subjects = {'Elect', 'Chem', 'Comp', 'Creat'};
studyDurations = [2, 2, 1.5, 1];

% Allocate study time for each subject/topic
for i = 1:numel(subjects)
    subject = subjects{i};
    duration = studyDurations(i);
    
    % Find an empty slot for the subject/topic
    [day, timeSlot] = find(studySchedule == 0, 1);
    
    % Check for conflicts or constraints and adjust if necessary
    % (You can add logic here to handle class schedules, breaks, etc.)
    
    % Update the study schedule
    studySchedule(day, timeSlot) = subject;
end

% Visualization (Optional)
figure;
imagesc(studySchedule);
colormap([1 1 1; 0.8 0.8 0.8; 0.6 0.6 0.6]); % Define colors
colorbar;
title('Study Schedule');
xlabel('Time Slot');
ylabel('Day');

