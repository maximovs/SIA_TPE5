function newPop = rep1(pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit)
	newPop = cell(populationSize,1);
		for i = 1:floor(populationSize/2)
	 		%selecciono 2 con algún método.
        	sel = feval(strcat('sel', selCriteria), pop, populationSize, 2, totalFit);
        	if(rand(1,1)<=pcross)
        		%se produce el cross
        		sel = feval(strcat('cross', crossover),sel)
        	endif
        	%#TODO: se muta
        	%#TODO: se backtrackea
        	newPop{i*2-1} = sel{1};
        	newPop{i*2} = sel{2};
        end
endfunction