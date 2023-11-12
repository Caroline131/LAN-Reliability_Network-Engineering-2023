%% Function runTwoSeriesLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure 
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCompoundNetworkSim(K,p,N)

    simResults = ones(1,N); % a place to store the result of each simulation
    
    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
        
        % Transmit packets until all of the packets have been successfully
        % transmitted.
        while pktSuccessCount < K
            success = false; % reset success to false
            
            % while packet transmissions is not successful (r < p)
            while success ~= true 
                r1 = rand; % generate random number to determine if packet is successful (r1 > p)
                r2 = rand; % generate random number to determine if packet is successful (r2 > p)
                txAttemptCount = txAttemptCount + 1; % count 1st attempt
                
                % Check if either of the parallel transmissions succeeded
                if r1 > p || r2 > p
                    % If the parallel link succeeded continue onto the series link 3                    
                    r = rand; % generate random number to determine if packet is successful                    
                    txAttemptCount = txAttemptCount + 1; % count additional attempt
                    % If the packet succeeds along link 3 then set success
                    % to true.  If not then try again from the begining.
                    if(r > p)
                        success = true;
                    end
                end
            end
            
            pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
        end
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before entire application message (K successful packets) transmitted
    end
    % Set the return result
    result = mean(simResults);
end