function newNet = mutClassic2(net,pmut)
	newNet = net;
	if(rand(1,1)<pmut)
		aux = rem(floor(rand(1,1)*3571),net.size)+1;
		newNet = putValue(net,aux,smartRand());
	endif

endfunction