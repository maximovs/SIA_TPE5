function value = getValue(net, pos)
	pos = pos-1;
	n=net.n;
	h=net.h;
	m=net.m;
	if(pos < (n+1)*m) 
		index = pos;
		value = net.weights{1}(floor(index/m)+1, rem(index,m)+1);
	elseif(pos < (n+1)*m + (m+1)*m ) 
		index = pos - (n+1)*m;
		value = net.weights{2}(floor(index/m)+1, rem(index,m)+1);
	else
		index = pos - ((n+1)*m + (m+1)*m);
		value = net.weights{3}(index+1,1);
	endif
endfunction