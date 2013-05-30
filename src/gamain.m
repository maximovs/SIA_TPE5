function net = gamain(inFileOrOp,txFun,lrnRate,populationSize,generations, G, replaceMethod, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop)
    beta=0.8;
    inputSize = 2;
    lrnStrategy=3;
    epochs=100;
    M = 9;
    H = 2;
    momentum=0;
    alpha=0.5;
    toReplace = floor(G*populationSize);
    % Init population
    pop = cell(populationSize,1);
    for i = 1:populationSize
        net = createNet(inputSize, M, H, lrnRate, lrnStrategy, momentum, alpha);
        net.amp = 1;
        if(strcmp(inFileOrOp,'and') || strcmp(inFileOrOp ,'or') || strcmp(inFileOrOp,'par') || strcmp(inFileOrOp,'xor'))
            trainSet = feval(strcat(inFileOrOp, num2str(inputSize)));
            net.trainSet = trainSet;
        else
            net = getTrainSet(net, inFileOrOp);
            trainSet = net.trainSet;
        endif
        % net = calculateFitness(net,txFun,beta);
        pop(i) = net;
    end
    for g = 1: generations
        %calculo fitness + ordeno + total fitness
        totalFit = 0;
        for r = 1:populationSize
            pop{r} = calculateFitness(pop{r},txFun,beta);
            totalFit += pop{r}.fitness;
            pop{r}.accumFitness = totalFit;
        end
        pop = sortPopulation(pop, populationSize);
        %selecciono método de reemplazo
        pop  = feval(replaceMethod,pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit);
       

    end

    pop = sortPopulation(pop, populationSize);
    net = pop{1};
endfunction
