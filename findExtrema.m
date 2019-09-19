%% [extrema, times, types] = findExtrema(t_Vec, signal, findType)
%   i) t_Vec = time vector corresponding to the signal
%   i) signal
%   i) findType = [optional input] {1,0,-1} ==> function outputs {maxima only, maxima and minima, minima only}
%   o) extrema = the list of found extrema
%   o) times = [optional output] the times corresponding to the extrema
%   o) types = [optional output] {1,-1} indicating whether the given
%              extrema is a {maxima, minima}

% This function finds all of the local minima and maxima in a given signal.
% I originally wrote the algorithm as part of my attempts to develop a
% rainflow coutning function. This algorithm found the "turning points" in
% the signal.

function [extrema, times, types] = findExtrema(t_Vec, signal, findType)
    if nargin==2
        findType = 0; %If no value was supplied, assume both maxima and minima
    end
    
    t_n = length(t_Vec);
    n_extrema = 0;
    
    extrema = zeros(t_n, 1);
    times = zeros(t_n, 1);
    types = zeros(t_n, 1);

    for i = 2:(t_n-1)
        isMaxima = (signal(i-1) < signal(i)) && (signal(i) > signal(i+1));
        isMinima = (signal(i-1) > signal(i)) && (signal(i) < signal(i+1));
        if( ((findType == 1) || (findType == 0)) && isMaxima )
            n_extrema = n_extrema + 1;
            extrema(n_extrema) = signal(i);
            times(n_extrema) = t_Vec(i);
            types(n_extrema) = 1;
        end
        if( ((findType == 0) || (findType == -1)) && isMinima )
            n_extrema = n_extrema + 1;
            extrema(n_extrema) = signal(i);
            times(n_extrema) = t_Vec(i);
            types(n_extrema) = -1;
        end
    end
    extrema = extrema(1:n_extrema); %Eliminate extraneous zeros
    times = times(1:n_extrema);
    types = types(1:n_extrema);
end