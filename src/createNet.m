function net = createNet(N,M,H,lrnRate,lrnStrategy,momentum, alpha)
	net.h=H;
	net.n=N;
	net.m=M;
	net.weights = cell(H+1,1);
	net.lastDWs = cell(H+1,1);
	maxRand = 0.7;
	if(H<1)
		net.weights{1} = rand(N+1,1)*maxRand;
		net.lastDWs{1} = zeros(N+1,1);
	else		
		net.weights{1} = rand(N+1,M)*maxRand;
		net.lastDWs{1} = zeros(N+1,M);
		for i = 2:H
			net.weights{i} = rand(M+1,M)*maxRand;
			net.lastDWs{i} = zeros(M+1,M);
		end
		net.weights{H+1} = rand(M+1,1)*maxRand;
		net.lastDWs{H+1} = zeros(M+1,1);
	endif
	net.out = 1;
	net.neurons = cell(H+1,1);
	for i = 1:H
		aux.deltas = zeros(1,M);
		aux.values = zeros(1,M);
		net.neurons{i} = aux;
	end
		aux.deltas = zeros(1);
		aux.values = zeros(1);
		net.neurons{H+1} = aux;
		net.count = 0;
		net.prevErr = 9999999999;
		net.lrnRate = lrnRate;
		net.lrnStrategy = lrnStrategy;
		net.lrn_A = 0.01;
		net.lrn_B = 0.7;
		net.lrn_K = 4;
		net.alpha = alpha;
		net.momentum = momentum;
endfunction
