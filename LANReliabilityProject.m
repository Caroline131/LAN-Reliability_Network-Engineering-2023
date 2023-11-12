%% LAN Reliability Project
% Caroline Scaife
% Professor Corbin Murrow
% Network Engineering
% 10-25-23

clear all;
close all;
clc;

%% Task 1
%-------------
%- Variables -
%-------------
k1 = 1;         % Constant which contains the number of packets transmitted
k2 = 5;         % Constant which contains the number of packets transmitted
k3 = 15;        % Constant which contains the number of packets transmitted
k4 = 50;        % Constant which contains the number of packets transmitted
k5 = 100;       % Constant which contains the number of packets transmitted
N = 1000;       % Constant which contains the number of itterations
index = 0;      % Define the initial index value
p = 0:0.01:1;   % This is an array of all possible probability values

% Calculate the expected values
E1_c = k1./(1-p);   % The expected values with k = 1
E2_c = k2./(1-p);   % The expected values with k = 5
E3_c = k3./(1-p);   % The expected values with k = 15
E4_c = k4./(1-p);   % The expected values with k = 50
E5_c = k5./(1-p);   % The expected values with k = 100

% Create a new figure and plot each calculated array
figure
semilogy(100*p,E1_c);   % Plot with a y-axis in log scale
hold on
semilogy(100*p,E2_c);
semilogy(100*p,E3_c);
semilogy(100*p,E4_c);
semilogy(100*p,E5_c);

% Simulate the values

% Step through the probability values and call runSingleLinkSim() for each
% probability value.  Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runSingleLinkSim(k1,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runSingleLinkSim(k2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runSingleLinkSim(k3,tempP,N); % Call the simulation function for the values for the k = 15
    E4_s(index) = runSingleLinkSim(k4,tempP,N); % Call the simulation function for the values for the k = 50
    E5_s(index) = runSingleLinkSim(k5,tempP,N); % Call the simulation function for the values for the k = 100
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0:0.01:0.99);

% Plot the curves simulated
plot(x,E1_s,'bo')   % Plot with blue circles
plot(x,E2_s,'ro')   % Plot with red circles
plot(x,E3_s,'yo')   % Plot with yellow circles
plot(x,E4_s, 'ko')  % Plot with black circles
plot(x,E5_s,'go')   % Plot with green circles

% Label the figure
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')
title('Average Number of Transmissions for a Single Link Network')
%% Task 2
clear all;
clc;
%-------------
%- Variables -
%-------------
k1 = 1;         % Constant which contains the number of packets transmitted
k2 = 5;         % Constant which contains the number of packets transmitted
k3 = 15;        % Constant which contains the number of packets transmitted
k4 = 50;        % Constant which contains the number of packets transmitted
k5 = 100;       % Constant which contains the number of packets transmitted
N = 1000;       % Constant which contains the number of itterations
index = 0;      % Define the initial index value
p = 0:0.01:1;   % This is an array of all possible probability values

% Calculate the expected values
E1_c = k1./((1-p).^2);  % The expected values with k = 1
E2_c = k2./((1-p).^2);  % The expected values with k = 5
E3_c = k3./((1-p).^2);  % The expected values with k = 15
E4_c = k4./((1-p).^2);  % The expected values with k = 50
E5_c = k5./((1-p).^2);  % The expected values with k = 100

% Create a new figure and plot each calculated array
figure
semilogy(100*p,E1_c);   % Plot with a y-axis in log scale
hold on
semilogy(100*p,E2_c);
semilogy(100*p,E3_c);
semilogy(100*p,E4_c);
semilogy(100*p,E5_c);

% Simulate the values

% Step through the probability values and call runTwoSeriesLinkSim() for each
% probability value.  Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runTwoSeriesLinkSim(k1,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runTwoSeriesLinkSim(k2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runTwoSeriesLinkSim(k3,tempP,N); % Call the simulation function for the values for the k = 15
    E4_s(index) = runTwoSeriesLinkSim(k4,tempP,N); % Call the simulation function for the values for the k = 50
    E5_s(index) = runTwoSeriesLinkSim(k5,tempP,N); % Call the simulation function for the values for the k = 100
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0:0.01:0.99);

% Plot the curves simulated
plot(x,E1_s,'bo')
plot(x,E2_s,'ro')
plot(x,E3_s,'yo')
plot(x,E4_s, 'ko')
plot(x,E5_s,'go')

% Label the figure
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')
title('Average Number of Transmissions for a Two Seires Link Network')
%% Task 3
clear all;
clc;
%-------------
%- Variables -
%-------------
k1 = 1;         % Constant which contains the number of packets transmitted
k2 = 5;         % Constant which contains the number of packets transmitted
k3 = 15;        % Constant which contains the number of packets transmitted
k4 = 50;        % Constant which contains the number of packets transmitted
k5 = 100;       % Constant which contains the number of packets transmitted
N = 1000;       % Constant which contains the number of itterations
index = 0;      % Define the initial index value

% Simulate the values

% Step through the probability values and call runParallelLinkSim() for each
% probability value.  Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runParallelLinkSim(k1,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runParallelLinkSim(k2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runParallelLinkSim(k3,tempP,N); % Call the simulation function for the values for the k = 15
    E4_s(index) = runParallelLinkSim(k4,tempP,N); % Call the simulation function for the values for the k = 50
    E5_s(index) = runParallelLinkSim(k5,tempP,N); % Call the simulation function for the values for the k = 100
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')   % Plot with blue circles
hold on
semilogy(x,E2_s,'ro')   % Plot wit red circles
semilogy(x,E3_s,'yo')   % Plot with yellow circles
semilogy(x,E4_s, 'ko')  % Plot with black circles
semilogy(x,E5_s,'go')   % Plot with green circles

% Label the figure
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')
title('Average Number of Transmissions for a Parallel Link Network')
%% Task 4
clear all;
clc;
%-------------
%- Variables -
%-------------
k1 = 1;         % Constant which contains the number of packets transmitted
k2 = 5;         % Constant which contains the number of packets transmitted
k3 = 15;        % Constant which contains the number of packets transmitted
k4 = 50;        % Constant which contains the number of packets transmitted
k5 = 100;       % Constant which contains the number of packets transmitted
N = 1000;       % Constant which contains the number of itterations
index = 0;      % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value.  Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCompoundNetworkSim(k1,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCompoundNetworkSim(k2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCompoundNetworkSim(k3,tempP,N); % Call the simulation function for the values for the k = 15
    E4_s(index) = runCompoundNetworkSim(k4,tempP,N); % Call the simulation function for the values for the k = 50
    E5_s(index) = runCompoundNetworkSim(k5,tempP,N); % Call the simulation function for the values for the k = 100
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')   % Plot with blue circles
hold on
semilogy(x,E2_s,'ro')   % Plot with red circles
semilogy(x,E3_s,'yo')   % Plot with yellow circles
semilogy(x,E4_s, 'ko')  % Plot with black circles
semilogy(x,E5_s,'go')   % Plot with green circles

% Label the figure
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')
title('Average Number of Transmissions for a Compound Link Network')
%% Task 5
clear all;
clc;
%%%%%%%%%%%%
% Figure 1 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
k1 = 1;     % Constant which contains the number of packets transmitted
k2 = 5;     % Constant which contains the number of packets transmitted
k3 = 10;    % Constant which contains the number of packets transmitted
p1 = 0.1;   % Constant which contains the probability of parallel link 1
p2 = 0.6;   % Constant which contains the probability of parallel link 2
N = 1000;   % Constant which contains the number of itterations  
index = 0;  % Define the initial index value

% Step through the probability values and call runCustomCompoundNetworkSim() for each
% probability value.  The varrying probability value is the series link 3.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,p1,p2,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(k2,p1,p2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,p1,p2,tempP,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
semilogy(x,E2_s,'ro')
semilogy(x,E3_s,'yo')

% Label the figure
title('Figure 1')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')

%%%%%%%%%%%%
% Figure 2 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
p1 = 0.6;   % Constant which contains the probability of parallel link 1
p2 = 0.1;   % Constant which contains the probability of parallel link 2
index = 0;  % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value.  The varrying probability value is the series link 3.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,p1,p2,tempP,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(k2,p1,p2,tempP,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,p1,p2,tempP,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
semilogy(x,E2_s,'ro')
semilogy(x,E3_s,'yo')

% Label the figure
title('Figure 2')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')

%%%%%%%%%%%%
% Figure 3 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
p1 = 0.1;   % Constant which contains the probability of parallel link 1
p3 = 0.6;   % Constant which contains the probability of series link 3
index = 0;  % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value.  The varrying probability value is the parallel link 2.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,p1,tempP,p3,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(2,p1,tempP,p3,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,p1,tempP,p3,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
semilogy(x,E2_s,'ro')
semilogy(x,E3_s,'yo')
% Label the figure
title('Figure 3')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')

%%%%%%%%%%%%
% Figure 4 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
p1 = 0.6;   % Constant which contains the probability of parallel link 1
p3 = 0.1;   % Constant which contains the probability of series link 3
index = 0;  % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value.  The varrying probability value is the parallel link 2.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,p1,tempP,p3,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(k2,p1,tempP,p3,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,p1,tempP,p3,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
semilogy(x,E2_s,'ro')
semilogy(x,E3_s,'yo')

% Label the figure
title('Figure 4')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')

%%%%%%%%%%%%
% Figure 5 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
p2 = 0.1;   % Constant which contains the probability of parallel link 2
p3 = 0.6;   % Constant which contains the probability of series link 3
index = 0;  % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value.  The varrying probability is the parallel link 1.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,tempP,p2,p3,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(k2,tempP,p2,p3,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,tempP,p2,p3,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
semilogy(x,E2_s,'ro')
semilogy(x,E3_s,'yo')

% Label the figure
title('Figure 5')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')

%%%%%%%%%%%%
% Figure 6 %
%%%%%%%%%%%%
%-------------
%- Variables -
%-------------
p2 = 0.6;   % Constant which contains the probability of parallel link 2
p3 = 0.1;   % Constant which contains the probability of series link 3
index = 0;  % Define the initial index value

% Step through the probability values and call runCompoundNetworkSim() for each
% probability value. The varrying probability is the parallel link 1.
% Due to the fact that the random value is limited to
% values less than 1 the values are limited to values less than 1.
for tempP = 0.01:0.01:0.99
    index = index + 1;    % increment the index
    E1_s(index) = runCustomCompoundNetworkSim(k1,tempP,p2,p3,N); % Call the simulation function for the values for the k = 1
    E2_s(index) = runCustomCompoundNetworkSim(k2,tempP,p2,p3,N); % Call the simulation function for the values for the k = 5
    E3_s(index) = runCustomCompoundNetworkSim(k3,tempP,p2,p3,N); % Call the simulation function for the values for the k = 10
end

% Define the x values associated with the simulated curves.  This is the
% same as the tempP value
x = 100*(0.01:0.01:0.99);

% Create a new figure and plot each calculated array
figure
% Plot the curves simulated
semilogy(x,E1_s,'bo')
hold on
plot(x,E2_s,'ro')
plot(x,E3_s,'yo')

% Label the figure
title('Figure 6')
xlabel('Probability (p)')
ylabel('Average/Expected number of Transmissions (E(z))')