function [x, P, K] = kfilt(x, P, b, A, F, Sigma_e, Sigma_eps)
%	KALMAN FILTER
%		[x, P, K] = kfilt(x, P, b, A, F, Sigma_e, Sigma_eps)
%		performs a linear kalman filter
%------------
%   returns:
%       x   : the state vector
%       P   : x's covariance
%------------
%   arguments:
%       x   : the state vector
%       P   : x's covariance
%       b   : the measurement vector
%       A   : the observation matrix
%       F   : the state transformation matrix
%       Sigma_e : the measurement error covariance
%       Sigma_eps   : the process error covariance

%   predict x_k|k-1
x = F * x;
%   predict P_k|k-1
P = F * P * F' + Sigma_eps;

%   compute kalman gain
K = P * A' * inv(Sigma_e + A * P * A');

%   correct x_k|k
x = x + K*(b - A * x);
%   correct P_k|k
P = P - K * A * P;
