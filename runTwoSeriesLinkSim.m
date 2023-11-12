%% Function runTwoSeriesLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure 
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runTwoSeriesLinkSim(K,p,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
        % Check if all of the packets have been transmitted successfully
        while pktSuccessCount < K
            
            r = rand; % generate random number to determine if packet is successful (r > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt
        
            % while packet transmissions is not successful (r < p)
            while r < p
                r = rand; % transmit again, generate new success check value r
                txAttemptCount = txAttemptCount + 1; % count additional attempt
                
                % if the packet is successful transmit across the second
                % link
                if r > p
                    r = rand; % generate a random number associated with the second link
                    txAttemptCount = txAttemptCount + 1; % count additional attempt
                end
            end
            
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end
    % return the average of the simulation results
    result = mean(simResults);
end