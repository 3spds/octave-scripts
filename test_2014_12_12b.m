%   12/12/14 - Kalman Filter test
%   Joe Mariglio
%-----------------------
%   tests kfilt...
%   F, A, Sigma can be
%       dynamic
%-----------------------

lambda = pol2cart(0.25*pi, 0.99999); % system dynamics described as a frequency
lambda = lambda(1) + (1i*lambda(2)); % complex amplitude
F = lambda; % assign to state transition matrix F

%   process error:
Sigma_eps = 2^2; % variance = stdev^2

spin = pol2cart(0.5*pi, 1); %  rotation for measurements
spin = spin(1) + (1i*spin(2));  % express as complex multiplication
A = spin;   % assign to measurement matrix A

%   measurement error:
Sigma_e = 2^2; % variance = stdev^2

%   generate a signal
tru=[]; % true state
tru(end+1) = randn*2;   % initial value
y = [tru(end) + randn*2]; % add noise to create a measurement
x = [inv(A)*y(1)];  % initial state estimate
P = [inv(A)*Sigma_e*inv(A')];   % initial state variance estimate
K = []; % kalman gain vector

%   run
nsamps = 20; % number of samples for the simulation
for t=1:nsamps
    [x(t+1), P(t+1), K(t)] = kfilt(x(t), P(t), y(t), A, F, Sigma_e, Sigma_eps); % run the filter
    tru(end+1) = randn*2+(F*tru(end)); % run simulation : new true state
    y(t+1) = (A*tru(end) + randn*2); % run simulation : new measurement
end

%   plot the results:
figure
hold on
grid on
% plot measurement data:
hz=plot(real(y),'r.');
% % plot a-posteriori state estimates:
hk=plot(real(x(2:end)),'b-');
ht=plot(real(tru),'g-');
legend([hz hk ht],'observations','Kalman output','true voltage',0)
title('Real Axis Projections')
hold off
