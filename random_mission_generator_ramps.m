%generates a random mission profile, staying at a random height for a
%random duration for a given amount of time

clear 
clc

altitudes = zeros(2,3000); %change the latter to change the duration of the mission, altitude commands are in .1 second intervals.

rand_scale  = 1.1; %scale-down to ensure that the ramps don't exceed max height
rand_length = 400; %length of random ramps

alt_change_probability = 200; %1/probability of a step altitue change - higher = less of a chance

rigHeight = 1.7; %test rig height
rigHeight = rigHeight/rand_scale; %; implementing the scaling 


alt0 = rand*rigHeight;
oldAlt = alt0;

for i =1:length(altitudes) %180 second mission with a new altitude command every .1s
    
    altitudes(1,i) = i/10; %timestep of 0.1s
    
    num = randi([1 1500]);
    if num == 2
        newAlt = rand*1.4;
        oldAlt = newAlt;
        altitudes(2,i) = newAlt;
    else
        altitudes(2,i) = oldAlt;
    end
end

random_ramps_up   = linspace(1,1.1,rand_length);
random_ramps_down = linspace(1.1,1,rand_length);


random_set = ones(1,length(altitudes));


for i = 1:5 %change the max index if you want more ramps and vice versa
    seed = randi([0 length(altitudes)-rand_length]); %random number between 0 and end of array - length of ramp imputs
    if randi([1 2]) == 1 %equal probability of generating an up or a down ramp
        random_set(seed:seed+rand_length-1) = random_ramps_up;
    else
        random_set(seed:seed+rand_length-1) = random_ramps_down;
    end
    altitudes(2,:) = random_set.*altitudes(2,:); %multiplies random ramps with the previously generated steps to create a convincing mission profile
end

plot(altitudes(1,:), altitudes(2,:))
        
save('advanced_missionProfile.mat','altitudes')

%timeSeries = timeseries(altitudes(:,2),altitudes(:,1));
    