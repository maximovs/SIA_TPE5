function sel = selElite(pop, populationSize, toSelect, totalFit)
	sel = cell(toSelect,1);
	for i=1:toSelect
		sel{i} = pop{i};
	end
endfunction