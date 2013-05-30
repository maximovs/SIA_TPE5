function netRet = putValue(net, pos, value)
	pos = pos-1;
	n=net.n;
	h=net.h;
	m=net.m;
	if(pos < (n+1)*m) 
		index = pos;
		net.weights{1}(floor(index/m)+1, rem(index,m)+1) = value;
	elseif(pos < (n+1)*m + (m+1)*m ) 
		index = pos - (n+1)*m;
		net.weights{2}(floor(index/m)+1, rem(index,m)+1) = value;
	else
		index = pos - ((n+1)*m + (m+1)*m);
		net.weights{3}(index+1,1) = value;
	endif
	netRet = net;
endfunction