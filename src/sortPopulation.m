function sortedPop = sortPopulation(pop, size)
	for i=1:size
		for j=1:size-1
			if(pop{j}.fitness < pop{j+1}.fitness)
				aux = pop{j};
				pop{j} = pop{j+1};
				pop{j+1} = aux;
			endif
		end
	end
	sortedPop = pop;
endfunction