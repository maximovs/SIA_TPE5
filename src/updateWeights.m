function newNet = updateWeights(net,in,txFun, beta)
	eta = net.lrnRate;
	alpha = net.alpha;
	dW = [-1 feval(txFun,in,beta)]'*(feval(strcat(txFun,'der'),net.neurons{1}.values,beta).*net.neurons{1}.deltas);
	if net.momentum == 1
		dW = dW*eta + alpha*net.lastDWs{1};
		net.lastDWs{1} = dW;
	else
		dW = dW*eta;
	endif
	net.weights{1} = net.weights{1} + dW;
	for i=1:net.h
		dW = [-1 feval(txFun,net.neurons{i}.values,beta)]'*(feval(strcat(txFun,'der'),net.neurons{i+1}.values,beta).*net.neurons{i+1}.deltas);
		if net.momentum == 1
			dW = dW*eta + alpha*net.lastDWs{i+1};
			net.lastDWs{i+1} = dW;
		else
			dW = dW*eta
		endif

		net.weights{i+1} = net.weights{i+1} + dW;
	end
	newNet = net;
endfunction
