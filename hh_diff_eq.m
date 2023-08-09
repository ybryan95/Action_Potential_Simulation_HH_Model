function [dydt] = hh_diff_eq(t,y)

is = 5;
id = 0.35;
%im = 25;
im = 50;

if (t>is) && (t<id+is)
    I=im;
%elseif (t>17.8) && (t<17.8+id) 
    %I = im;
elseif (t>15) && (t<15+id) 
    I = im;
else
    I = 0;
end

V=y(1,1);
m=y(2,1);
n=y(3,1);
h=y(4,1);
vRest=-65;

vMem=V-vRest; 

gNa = 120; %mS/cm^2
gK = 36; %mS/cm^2
gL = 0.3; %ms/cm^2

exNa = 490; %mmol/L
exK = 20;
inNa = 50;
inK = 400;

mC = 1; %uF/cm^2
lNp = -50; %mV
nNa = 57.59;
nK = -75.59;


a_n=.01*(10-vMem)./(exp((10-vMem)/10)-1);
b_n=.125*exp(-vMem/80);

a_m=.1*(25-vMem)./(exp((25-vMem)/10)-1);
b_m=4*exp(-vMem/18);

a_h=0.07*exp(-vMem/20);
b_h=1/(exp((30-vMem)/10)+1);


%ode V, n, m, h
dydt(1,1)= ((I-gNa*m^3*h*(V-nNa))-(gK*n^4*(V-nK))-(gL*(V-lNp)))/mC ; 
dydt(2,1)= (a_m*(1-m)-b_m*m);
dydt(3,1)= (a_n*(1-n)-b_n*n); 
dydt(4,1)= (a_h*(1-h)-b_h*h);

end
