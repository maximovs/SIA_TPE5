function sel = selRuleta(pop, populationSize, toSelect, totalFit)
	pop = setAccumFitness(pop, populationSize);
	sel = cell(toSelect,1);
	for i=1:toSelect
		r = rand(1,1)*totalFit;
		for j=1:populationSize
			if(r<pop{j}.accumFitness)
				sel{i} = pop{j};
				break;
			endif
		end
	end
endfunction