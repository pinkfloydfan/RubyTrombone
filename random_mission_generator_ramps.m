%generates a random mission profile, staying at a random height for a
%random duration for a given amount of time

%TEST CODE: ATTEMPS TO GENERATE A FEW RAMPS and multiplies stuff with them

clear 
clc

altitudes = zeros(2,1800);

rigHeight = 1.4;

alt0 = rand*rigHeight;
oldAlt = alt0;

for i =1:length(altitudes) %60 second mission with a new altitude command every .1s
    
    altitudes(1,i) = i/10; %timestep of 0.1s
    
    num = randi([1 150]);
    if num == 2
        newAlt = rand*1.4;
        oldAlt = newAlt;
        altitudes(2,i) = newAlt;
    else
        altitudes(2,i) = oldAlt;
    end
end

random_ramps_up   = linspace(0.5,1,100);
random_ramps_down = linspace(0.5,1,100);

randi 

for i = 1:5
    seed = randi([0 length(altitudes)

random_set_1 = zeros(1,length(altitudes));

save('advanced_missionProfile.mat','altitudes')

%timeSeries = timeseries(altitudes(:,2),altitudes(:,1));
    