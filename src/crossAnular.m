function newSel = crossAnular(sel)
	from = rem(floor(rand(1,1)*3571),sel{1}.size)+1;
	to = from + rem(floor(rand(1,1)*3571),sel{1}.size/2)+1;
	for j=from:to
		i=rem(j-1,sel{1}.size)+1;
		aux = sel{1}.Ws(i);
		sel{1}.Ws(i) = sel{2}.Ws(i);
		sel{2}.Ws(i) = aux;
	end
	newSel = sel;
endfunction