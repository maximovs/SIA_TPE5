function newNet = calculateFitness(net,txFun,beta)
	trainSet = shuffle(net.trainSet);
 	error = 0;
    for i = 1: size(trainSet, 1)
		%Calculamos la salida
		net = evaluateNet(net,trainSet{i}{1},txFun,beta);
		%update de error
		error = error + getError(net.out, trainSet{i}{2});
    end
    avgError = error/size(trainSet,1);
    if (avgError>1)
    	avgError = sqrt(avgError);
    else
    	avgError = avgError*avgError;
    endif
    net.fitness = 1/avgError;
    newNet=net;
endfunction