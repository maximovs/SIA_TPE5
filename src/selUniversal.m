function sel = selUniversal(pop, populationSize, toSelect, totalFit)
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