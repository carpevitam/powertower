% POWER TOWER
% x || n

%       x     x^x     x^(x^x)
% n=.01
% .02
% .03
% .04

clear all;
clc;
close all;

n_size = 10000;
x_time = 1000;
time = .00005;

%%
results = ones(n_size,x_time);

for N = 1:n_size
    results(N,1) = N/n_size;
    for X = 2:x_time
        results(N,X) = results(N,1) ^ results(N,X-1);
    end
end

% PLOT OF ALL
n_range = 1/n_size:1/n_size:1;
for N = 1:x_time
    plot(n_range,results(:,N));
    title(['x||n, n =' int2str(N)])
    xlabel('n:0->1');
    ylabel('x||n');
    axis([0 1 0 1])
    pause(time)
end

%% PLOT OF ODD
n_range = 1/n_size:1/n_size:1;
for N = 1:2:x_time
    plot(n_range,results(:,N));
    title(['x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('x||n');
    axis([0 1 0 1])
    pause(time)
end

%% PLOT OF EVEN
n_range = 1/n_size:1/n_size:1;
for N = 2:2:x_time
    plot(n_range,results(:,N));
    title(['x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('x||n');
    axis([0 1 0 1])
    pause(time)
end

%% ERROR PLOT
error = ones(n_size,x_time-1);
err_r = ones(n_size,x_time-1);
for N = 2:x_time-1
    error(:,N) = results(:,N) - results(:,N-1);
    err_r(:,N) = error(:,N) ./ results(:,N);
end
disp(N)
n_range = 1/n_size:1/n_size:1;
for N = 1:x_time-1
    subplot(1,2,1);
    plot(n_range,error(:,N));
    title(['ERROR x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
    axis([0 1 -1 1])
    
    subplot(1,2,2);
    plot(n_range,err_r(:,N));
    title(['ERROR Relative x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
%    axis([0 1 -1 1])
    pause(time)
end

%% PLOT OF ODD
for N = 1:2:x_time-1
    subplot(1,2,1);
    plot(n_range,error(:,N));
    title(['ERROR x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
    axis([0 1 -1 1])
    
    subplot(1,2,2);
    plot(n_range,err_r(:,N));
    title(['ERROR Relative x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
    axis([-.1 1 -1000 1])
    pause(time)
end

%% PLOT OF EVEN

for N = 2:2:x_time-1
    subplot(1,2,1);
    plot(n_range,error(:,N));
    title(['ERROR x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
    axis([0 1 -1 1])
    
    subplot(1,2,2);
    plot(n_range,err_r(:,N));
    title(['ERROR Relative x||n, n =' int2str(N)])
    xlabel('x:0->1');
    ylabel('Error from prev x||n');
%    axis([0 1 -1 1])
    pause(time)
end
