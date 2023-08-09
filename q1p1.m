clc;
clear;
close all;
% MAIN PROGRAM P1, P2

%Initial parameters
y0(1,1) = -65; % Initial Membrane Voltage
y0(2,1) = 0.05; %m
y0(3,1) = 0.32; %n
y0(4,1) = 0.59; %h

dt=[0,40];  % time of integration in ms
Temp = 20; %Body Temp
Gas = 8.31;
Faraday = 96485.33;
Kelvin = 273 + Temp;

gNa = 120; %mS/cm^2
gK = 36; %mS/cm^2
gL = 0.3; %ms/cm^2
exNa = 490; %mmol/L
exK = 20;
inNa = 50;
inK = 400;
lNp = -50; %mV
mC = 1; %uF/cm^2

%Na, K Nernst Potential
nNa = (Gas * Kelvin) / Faraday * 1000 * log(exNa / inNa);
nK = (Gas * Kelvin) / Faraday * 1000 * log(exK / inK);

%setup
is = 5;
id = 0.35;
%im = 25;
im = 50;


options=odeset('RelTol',1e-4,'AbsTol',[1e-8, 1e-8, 1e-8, 1e-8],'MaxStep',0.01);
[t,y]=ode45('hh_diff_eq',dt,y0,options);

iK = ((y(:,3).^4) .* (y(:,1)-nK)) .* gK ;
iNa = ((y(:,2).^3) .* y(:,4) .* (y(:,1)-nNa)) .* gNa ;

I=zeros(1,length(t));
for t0=1:length(t)
    if t(t0)>is && t(t0)<(is+id)
        I(t0)=im;
    end
end

V=y(:,1);
m=y(:,2);
n=y(:,3);
h=y(:,4);

iNa = (m.^3 .* h .* (V-nNa)) .* gNa ;
iK = (n.^4 .* (V-nK)) .* gK;


figure(1);
[ax,p1] = plotyy(t,I,t,y(:,1))
title('Square pulse triggering action potential')
xlabel('time (ms)')
ylabel('Voltage (mV)', 'Color', '#EDB120')
legend('Is', 'Vm')

figure(2);
plot(t,iNa,t,iK)
ylabel('Current Density (J)')
xlabel('time (ms)')
title('Change in iNa and iK')
legend('iNa','iK')

 
figure(3);
plot(t,y(:,2))
hold all
plot(t,y(:,3))
plot(t,y(:,4))
title('Change in m,n,h gates')
legend('m (Na+ Channel Opening)','n (K+ Channel Opening)','h (Na+ Channel Closing')
xlabel('time (ms)')
ylabel('Activation status')

% P3
figure(4);
[ax,p1] = plotyy(t,I,t,y(:,1))
title('Square pulse triggering action potential twice t=5ms, t2=17.8ms')
xlabel('time (ms)')
ylabel('Voltage (mV)', 'Color', '#EDB120')
legend('Is', 'Vm')


figure(5);
[ax,p1] = plotyy(t,I,t,y(:,1))
title('Square pulse triggering action potential twice t=5ms, t2=15ms')
xlabel('time (ms)')
ylabel('Voltage (mV)', 'Color', '#EDB120')
legend('Is', 'Vm')


clc;
clear all; close all;

gNa = 120; %mS/cm^2
gK = 36; %mS/cm^2
nNa = 57.59;
nK = -75.59;
y0(1,1) = -65; % Initial Membrane Voltage
y0(2,1) = 0.05; %m
y0(3,1) = 0.32; %n
y0(4,1) = 0.59; %h


dt = [0,20];
options = odeset('RelTol',1e-4,'AbsTol',[1e-8,1e-8,1e-8,1e-8],'MaxStep',0.01);
[t,y] = ode45('hhdiff2',dt,y0,options);
V=y(:,1);
m=y(:,2);
n=y(:,3);
h=y(:,4);
iNa = (m.^3 .* h .* (V-nNa)) .* gNa ;
iK = (n.^4 .* (V-nK)) .* gK;




figure
subplot(3,1,1);
plot(t,y(:,1));
xlabel('time (ms)');
ylabel('Voltage (mV)');
title('Anode Break Initiation Observation')


subplot(3,1,2);
plot(t,m);
hold all
xlabel('time (ms)');
ylabel('Probability');
plot(t,n);
xlabel('time (ms)');
ylabel('Probability');
plot(t,h);
xlabel('time (ms)');
ylabel('Probability');
legend('m','n','h');

subplot(3,1,3);
plot(t,iNa);
hold all
xlabel('time (ms)');
ylabel('current (mA)');
plot(t, iK);
legend('iNa','iK');






