function sel = selMix(pop, populationSize, toSelect, totalFit, N, selCriteria)
	if N > populationSize
		N = populationSize;
	endif
	sel1 = selElite(pop, populationSize, N, totalFit);
	sel2 = feval(strcat('sel', selCriteria), pop, populationSize, toSelect - N, totalFit);
	sel = [sel1; sel2];

endfunction