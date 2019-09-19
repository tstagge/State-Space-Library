%% lpf = ssLPF(f_b)
%   i) f_b = [Hz] break frequency
%   o) lpf = a first-order system with a pole at -2*pi*f_b (right?), i.e. a
%            low pass filter with a break frequency @ f_b Hz

%% Numerical State Space Functions: ssLPF()
% [v1.0] [2019.08.04]

% SS function used directly:    createSSmodel()

function lpf = ssLPF(f_b)
    omega_b = 2*pi*f_b;
    A = [-omega_b];
    B = -A;
    C = [1];
    D = 0;
    
    lpf = createSSmodel(A,B,C,D);
end