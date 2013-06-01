function sel = selTorneos(pop, populationSize, toSelect, totalFit, generation)
	sel = cell(toSelect,1);
	r = rand(1,1)*totalFit;
	for i=1:toSelect
		f = pop{rem(floor(rand(1,1)*3571),populationSize)+1};
		s = pop{rem(floor(rand(1,1)*3571),populationSize)+1};
		if(f.fitness<s.fitness)
			aux = s;
			s = f;
			f = aux;
		endif
		if(rand(1,1)<0.75)
			sel{i} = f;
		else
			sel{i} = s;
		endif
	end
endfunction