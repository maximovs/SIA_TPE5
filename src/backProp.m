function newSub = backProp(sub,txFun,beta, net, epochs)
	newSub = sub;
	net = putWs(net,sub.Ws);
	%epochs = 10;
	trainSet = net.trainSet;
	%calculas los o de cada capa
    net.epochErrors = zeros(epochs,1);
	for j = 1:epochs
		error = 0;
	    
	    trainSet = shuffle(trainSet);
	    for i = 1: size(trainSet, 1)

	%Calculamos la salida
			net = evaluateNet(net,trainSet{i}{1},txFun,beta);
	%calculo de deltas
			net = calculateDeltas(net, trainSet{i}{2});
	%update de pesos
			net = updateWeights(net,trainSet{i}{1},txFun,beta);
	%update de error
			error = error + getError(net.out, trainSet{i}{2});
	    end
	    epochError = error/size(trainSet,1);
	    net = updateLrnRate(net, epochError);
	    net.epochErrors(j) = epochError;
	end
	newSub.Ws = getWs(net);
endfunction