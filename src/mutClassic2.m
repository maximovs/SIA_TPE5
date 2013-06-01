function newSub = mutClassic2(sub,pmut)
	newSub = sub;
	for i=1:sub.size
		if(rand(1,1)<pmut/sub.size)
			newSub.Ws(i) = smartRand();
		endif
	end
endfunction