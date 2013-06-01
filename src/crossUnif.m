function newSel = crossUnif(sel)
	for i=1:sel{1}.size
		if(rand(1,1)<0.75)
			aux = getValue(sel{1},i);
			sel{1} = putValue(sel{1},i,getValue(sel{2},i));
			sel{2} = putValue(sel{2},i,aux);
		endif
	end
	newSel = sel;
endfunction