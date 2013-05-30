function newNet = updateLrnRate (net, error)
	%Updates the learn rate according to learn strategy
	%1 = CONSTANT
	%2 = ANNEALED
	%3 = ADAPTATIVE
	%min learn rate is 0.025
	%max learn rate is 0.5
	
	if(net.lrnStrategy ==2)
		net.count = net.count + 1;
		if(net.count == 50)
			net.count = 0;
			net.lrnRate = net.lrn_B * net.lrnRate;
		endif
	endif
	if(net.lrnStrategy == 3)
		if(error > net.prevErr)
			net.count = 0;
			net.lrnRate = net.lrn_B * net.lrnRate;
			if( net.lrnRate < 0.025)
				net.lrnRate = 0.025;
			endif
		elseif( error < net.prevErr)
			net.count +=1;
			if(net.count >= net.lrn_K)
				net.lrnRate = net.lrnRate + net.lrn_A;
				if(net.lrnRate > 0.5)
					net.lrnRate = 0.5;
				endif
			endif
		endif
	endif
	net.prevErr = error;
	newNet = net;
endfunction
