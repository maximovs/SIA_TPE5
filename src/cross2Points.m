function newSel = cross2Points(sel)
	from = rem(floor(rand(1,1)*3571),sel{1}.size)+1;
	to = from + rem(floor(rand(1,1)*3571),sel{1}.size-from)+1;

	for i=from:to
		aux = sel{1}.Ws(i);
		sel{1}.Ws(i) = sel{2}.Ws(i);
		sel{2}.Ws(i) = aux;
	end
	newSel = sel;
endfunction