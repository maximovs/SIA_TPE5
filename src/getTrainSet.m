function newNet = getTrainSet(net, file)
	values = load(file);
	values = values.x;
	net.min = min(values);
	net.max = max(values);
	net.amp = max(abs(net.min),abs(net.max));
	net.amp = 4;
	values = values./net.amp;
	res = cell(size(values,2)*0.30,2);
	for i=1:size(res, 1)
		res{i} = {values(i:i+2) values(i+3)};
	end

	net.trainSet = res;
	newNet = net;
endfunction
