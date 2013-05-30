function graph(net, file, txFun, beta, from, to)
	values = load(file);
	values = values.x;
	net.min = min(values);
	net.max = max(values);
	net.amp = max(abs(net.min),abs(net.max));
	net.amp = 4;
	values = values./net.amp;
	values = values(from:to);
	trainSet = cell(size(values(),2),2);
	for i=1:(size(trainSet, 1)-3)
		trainSet{i} = {values(i:i+2) values(i+3)};
	end

	netFunction = zeros(1, size(trainSet, 1)-3);
	for i = 1: size(trainSet, 1)-3
		net = evaluateNet(net,trainSet{i}{1},txFun,beta);
		netFunction(i) = net.out;
	end

subplot(3,1,3);
plot([from:to], abs([values(1:3) netFunction] - values(1:size(trainSet, 1))), '-4; Error;');
  ylabel ('Error');
values = values.*net.amp;
netFunction = netFunction.*net.amp;
	subplot(3,1,1);
	plot([from:to], values(1:size(trainSet, 1)));
  ylabel ('Funcion original');
	subplot(3,1,2);
	plot([from:to], [values(1:3) netFunction]);
  ylabel ('Funcion aprendida por la red');

endfunction