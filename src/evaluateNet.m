function newNet = evaluateNet(net,input,txFun,beta)
	o = [-1 input];
	for i = 1:net.h
		aux = feval(txFun,o*net.weights{i},beta);
		net.neurons{i}.values = o*net.weights{i};
		o = [-1 aux];
	end
	net.neurons{net.h+1}.values = o*net.weights{net.h+1};
	o = feval(txFun,o*net.weights{net.h+1},beta);
	net.out = o;
	newNet = net;
endfunction