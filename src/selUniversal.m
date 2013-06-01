function sel = selUniversal(pop, populationSize, toSelect, totalFit)
	sel = cell(toSelect,1);
	rs = rand(1,1)*totalFit/toSelect;
	for i=1:toSelect
		r = (rs + i - 1)/toSelect;
		for j=1:populationSize
			if(r<=pop{j}.accumFitness)
				sel{i} = pop{j};
				break;
			endif
		end
	end
endfunction