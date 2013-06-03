function newPop = setAccumFitness(pop, populationSize)	
	totalFit = 0;
	for r = 1:populationSize
	    totalFit += pop{r}.fitness;
	    pop{r}.accumFitness = totalFit;
	end
	newPop = pop;
end