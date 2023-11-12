%% Function runParallelLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure 
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runParallelLinkSim(K,p,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
        
        % Check if all of the packets have been transmitted successfully
        while pktSuccessCount < K
            success = false;
            r1 = rand; % generate random number to determine if packet is successful (r1 > p)
            r2 = rand; % generate random number to determine if packet is successful (r2 > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt
            
            % Check if first transmission succeeded
            if r1 > p || r2 > p    % Only one of the transmissions in a parallel link must succeed in a parallel link
                success = true;
            end
            
            % while packet transmissions is not successful continue
            while success ~= true 
                r1 = rand; % generate random number to determine if packet is successful (r1 > p)
                r2 = rand; % generate random number to determine if packet is successful (r2 > p)
                txAttemptCount = txAttemptCount + 1; % count additional attempts
                
                % Check for success
                if r1 > p || r2 > p
                    success = true;
                end
            end
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end
    % Set the return value
    result = mean(simResults);
end