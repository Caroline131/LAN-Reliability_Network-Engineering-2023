%% Function runCustomCompoundNetworkSim()
% Parameters
%  K - the number of packets in the application message
%  p1 - the probability of failure for link 1
%  p2 - the probability of failure for link 2
%  p3 - the probability of failure for link 3
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K,p1,p2,p3,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
        while pktSuccessCount < K
            success = false;
            r1 = rand; % generate random number to determine if packet is successful (r1 > p)
            r2 = rand; % generate random number to determine if packet is successful (r2 > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt
            
            % Check if the packet was successfully transmitted accross the
            % parallel links 1 or 2
            if r1 > p1 || r2 > p2
               % If successful then transmit across the series link 3
               r = rand; % genereate a random number for the series link
               txAttemptCount = txAttemptCount + 1; % count additional attempt
               
               % Check if the series link 3 transmission was successful
               if(r > p3)
                    success = true; % Set success equal to true
               end
            end
            
            % while packet transmissions is not successful (r < p)
            while success ~= true 
                r1 = rand; % generate random number to determine if packet is successful (r1 > p)
                r2 = rand; % generate random number to determine if packet is successful (r2 > p)
                txAttemptCount = txAttemptCount + 1; % count 1st attempt
                
                % Check if the packet was successfully transmitted accross the
                % parallel links 1 or 2
                if r1 > p1 || r2 > p2
                    % If successful then transmit across the series link 3
                    r = rand; % genereate a random number for the series link
                    txAttemptCount = txAttemptCount + 1; % count additional attempt
                    
                   % Check if the series link 3 transmission was successful
                    if(r > p3)
                        success = true;
                    end
                end
            end
            
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end
    % Set the returned result
    result = mean(simResults);
end