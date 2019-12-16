% Term Project
clear, clc;
                    %Constants
C = .45; % Power Coefficient
p = 101325;
k = 0.000133; %constant to convert to kW
                    % Input Variables
H = 10; % Height of Turbines (feet)  
S = [11.6, 11.6, 12.1, 13.6, 12.4, 11.4, ... % Wind Speed mi/hr ave per Month (Fargo)
    9.9, 10.4, 11.7, 12.5, 13.6, 12.1]; % mean 11.9

T = [18, 24, 36, 56, 69, 77, 83, 81, 71, 56, 37, 22];  %ave temp each month Fargo (F)
P = (p/287.058)*T;  %Air Denisty per month
r = 5;   % Blade Radius (feet)
m = [1:12];
 hold on                   
for i= 1:13
        A= pi*r^2;
        Sh= S.*((H/(1000))).^(.14);
        Po= (.5*k*C)*(P.*(A.*Sh.^3))/12; %Power produced per month  
        r= r+5; %radius increasing increments of 5ft
        H= H+10; %height increasing increments of 10ft
        E= sum(Po)*(10^(-3)) %Total Energy produced MW year
        figure(1);       %Figure 1
        plot(m,Po), xlabel('month'),ylabel('Power Produced (Watts)'),...
            axis([1,12,0,750000]), ...
            lgd = legend({'20','30','40','50','60','70',...
            '80','90','100','110','120','130', '140'}, ...
            'Location', 'eastoutside'), title(lgd, 'Feet'), ...
            title('Monthly Production');
        hold on 
        Eh = E/8760; %MW/hr
        figure(2);      %Figure 2
        plot(H,Eh, '*'), xlabel('height (ft)'), title('Turbine hourly production'),...
            ylabel('MegaWatts/hr'), axis([20,140,0,.75]);
end

fprintf(' E= %d\n', E);
