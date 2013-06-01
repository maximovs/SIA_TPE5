function newSel = crossClassic(sel)
	from = rem(floor(rand(1,1)*3571),sel{1}.size)+1;
	for i=from:sel{1}.size
		aux = sel{1}.Ws(i);
		sel{1}.Ws(i) = sel{2}.Ws(i);
		sel{2}.Ws(i) = aux;
	end
	newSel = sel;
endfunction