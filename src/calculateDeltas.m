function newNet = calculateDeltas(net,s)
	net.neurons{net.h+1}.deltas = s-net.out;
	for i = 1:net.h
		j = net.h+1-i;
		net.neurons{j}.deltas = net.neurons{j+1}.deltas*((net.weights{j+1}')(:,2:net.m+1));
	end
	newNet = net;
endfunction