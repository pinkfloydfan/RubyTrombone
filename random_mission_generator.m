%generates a random mission profile, staying at a random height for a
%random duration for a given amount of time

clear 
clc

altitudes = zeros(2,1800);

rigHeight = 1.4;

alt0 = rand*rigHeight;
oldAlt = alt0;

for i =1:length(altitudes) %60 second mission with a new altitude command every .1s
    
    altitudes(1,i) = i/10; %timestep of 0.1s
    
    num = randi([1 30]);
    if num == 2
        newAlt = rand*1.4;
        oldAlt = newAlt;
        altitudes(2,i) = newAlt;
    else
        altitudes(2,i) = oldAlt;
    end
end

save('missionProfile.mat','altitudes')

%timeSeries = timeseries(altitudes(:,2),altitudes(:,1));
    