clc
%clear
close all
%%  inport data
fu='C:\Users\user\Desktop\應用生物力學\HW4\20220413\MT_0120053C-004-0002_00B419FD.csv';
ff='C:\Users\user\Desktop\應用生物力學\HW4\20220413\MT_0120053C-004-0002_00B41A05.csv';
ru = xlsread(fu,'N6:P507');
rd = xlsread(ff,'N6:P507');
ful='C:\Users\user\Desktop\應用生物力學\HW4\20220413\MT_0120053C-004-0002_00B4199B.csv';
ffl='C:\Users\user\Desktop\應用生物力學\HW4\20220413\MT_0120053C-004-0002_00B41A0D.csv';
lu = xlsread(ful,'N6:P507');
ld = xlsread(ffl,'N6:P507');
bv = []; %make back vector
for i = 1:length(ru)
    k = [0 0 -1];
    bv(i,:) = k;
end

%% transport data to function
[rxk,ryk] = ang(ru,rd);
[lxk,lyk] = ang(lu,ld);
[rxh,ryh] = ang(bv,ru);
[lxh,lyh] = ang(bv,lu);
%% plot data
sgtitle('Normal Walking') 

subplot(2,1,1)
plot(rxk,ryk)
hold on
plot(lxk,lyk)
title('Knee Angle')
xlabel('Time(s)')
ylabel('Angle(\circ)')
xlim([0 5])

subplot(2,1,2)
plot(rxh,ryh)
hold on
plot(lxh,lyh)
title('Hip Angle')
xlabel('Time(s)')
ylabel('Angle(\circ)')
xlim([0 5])
%% input matrix output angle
function [t,a] = ang(u,f)
su = u.*u;
sf = f.*f;
anglel = [];
 for i=1:length(u)
    umag = sqrt(sum(su(i,:)));
    fmag = sqrt(sum(sf(i,:)));
    d = dot(u(i,:),f(i,:));
    angle(i,1) = i; %frame
    angle(i,2) = rad2deg(acos(d/(umag*fmag)));
 end
 t = angle(:,1)/100;
 a = angle(:,2);
end