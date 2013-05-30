function net = main(beta,inputSize,inFileOrOp,txFun,lrnRate, lrnStrategy, epochs, M, H,momentum, alpha)
    net = createNet(inputSize, M, H, lrnRate, lrnStrategy, momentum, alpha);
    net.amp = 1;

    if(strcmp(inFileOrOp,'and') || strcmp(inFileOrOp ,'or') || strcmp(inFileOrOp,'par') || strcmp(inFileOrOp,'xor'))
        trainSet = feval(strcat(inFileOrOp, num2str(inputSize)));
        net.trainSet = trainSet
    else
        net = getTrainSet(net, inFileOrOp);
        trainSet = net.trainSet;
    endif

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
subplot(1,1,1);
plot(1:epochs, net.epochErrors, '-4; Error;');
endfunction
