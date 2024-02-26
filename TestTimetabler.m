
%for i = 1:3
% Input subject/topic data
subjects = {'Elect', 'Mater', 'Comp', 'Creat'};
unchangables = [1 23 24 21 22 1 34 34;
                1  0  0 22 23 1  0  0; 
                23 0  0 22 21 1  0  0; 
                1 33 33  0 21 1  0  0; 
                1  0  0 22 21 1  0  0];
TimeTable = TimeTabler(subjects, unchangables);
%end