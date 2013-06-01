function newSel = crossUnif(sel)
	for i=1:sel{1}.size
		if(rand(1,1)<0.75)
			aux = sel{1}.Ws(i);
			sel{1}.Ws(i) = sel{2}.Ws(i);
			sel{2}.Ws(i) = aux;
		endif
	end
	newSel = sel;
endfunction