function newNet = getTrainSetCos(net, file)

y = zeros(100,1);
x = zeros(100,1);
for i=1:100

	x(i) = i/100*pi;
	y(i) = cos(x(i));
end
	net.min = min(0);
	net.max = max(0);
	net.amp = max(abs(net.min),abs(net.max));
	net.amp = 1;

	res = cell(100,2);
	for i=1:100
		res{i}{1} = x{i};
		res{i}{2} = y{i};
	end

	net.trainSet = res;
	newNet = net;
endfunction