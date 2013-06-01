function newNet = backProp(net,txFun,beta)
	epochs = 100;
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
	newNet = net;
endfunction