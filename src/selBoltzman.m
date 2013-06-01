function sel = selBoltzman(pop, populationSize, toSelect, totalFit, generation)
	totalExpVal = 0;
	T = 100*pow(.8,generation); %FALTA HACER
	for r = 1:populationSize
		pop{r}.ExpVal = exp(pop{r}.totalFit/)
	   	totalExpVal += pop{r}.ExpVal;
	   	pop{r}.accumExpVal = totalExpVal;
	end

	sel = cell(toSelect,1);
	r = rand(1,1)*totalFit;
	for i=1:toSelect
		r = (r + i - 1)/toSelect;
		for j=1:toSelect
			if(r<pop{j}.accumFitness)
				sel{i} = pop{j};
				break;
			endif
		end
	end
endfunction