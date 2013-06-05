function sel = selBoltzman(pop, populationSize, toSelect, totalFit, generation)
	generationExpVal = 0;

	%cae 10% cada 5 generaciones
	colderFactor = .9**floor(generation/5);
	T=100*colderFactor;

	for r = 1:populationSize
		pop{r}.ExpVal = exp(pop{r}.fitness/T);
	   	generationExpVal += pop{r}.ExpVal;
	end
	
	avrExpVal = generationExpVal/populationSize;
	totalExpVal = 0;
	for r = 1:populationSize
		pop{r}.ExpVal = pop{r}.ExpVal/avrExpVal;
	   	totalExpVal += pop{r}.ExpVal;
	   	pop{r}.accumExpVal = totalExpVal;
	end

	sel = cell(toSelect,1);
	for i=1:toSelect
		r = rand(1,1)*totalExpVal;
		for j=1:populationSize
			if(r<pop{j}.accumExpVal)
				sel{i} = pop{j};
				break;
			endif
		end
	end
	size(sel,1);
endfunction