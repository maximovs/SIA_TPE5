function newPop = rep1(epochs, pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit, txFun, beta, net, generation, selMixCriteria, selMixN)
	newPop = cell(populationSize,1);
		for i = 1:floor(populationSize/2)
	 		%selecciono 2 con algún método.
        	sel = feval(strcat('sel', selCriteria), pop, populationSize, 2, totalFit, generation, selMixN, selMixCriteria);

        	if(rand(1,1)<=pcross)
        		%se produce el cross
        		sel = feval(strcat('cross', crossover),sel);
        	endif
        	%#TODO: se muta
        	sel{1} = feval(strcat('mut', mutation), sel{1}, pmut);
        	sel{2} = feval(strcat('mut', mutation), sel{2}, pmut);

        	%#TODO: se backpropaguea
        	for j=1:2
        		if(rand(1,1)<pbackprop)
        			sel{j} = backProp(sel{j},txFun,beta,net,epochs);
        		endif
        	end

        	newPop{i*2-1} = sel{1};
        	newPop{i*2} = sel{2};
        end
endfunction