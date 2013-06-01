function newSub = mutClassic1(sub,pmut)
	newSub = sub;
	if(rand(1,1)<pmut)
		aux = rem(floor(rand(1,1)*3571),sub.size)+1;
		newSub.Ws(aux) = smartRand();
	endif

endfunction