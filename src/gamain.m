function net = gamain()
    properties = parameters();
    inFileOrOp = properties.inFileOrOp;
    txFun = properties.txFun;
    lrnRate = properties.lrnRate;
    populationSize = properties.populationSize;
    generations = properties.generations;
    G = properties.G;
    replaceMethod = properties.replaceMethod;
    selCriteria = properties.selCriteria;
    repCriteria = properties.repCriteria;
    crossover = properties.crossover;
    pcross = properties.pcross;
    mutation = properties.mutation;
    pmut = properties.pmut;
    mutAdaptation = properties.mutAdaptation;
    pbackprop = properties.pbackprop;
    selMixCriteria = properties.selMixCriteria;
    selMixN = properties.selMixN;
    minError = properties.minError;
    breakMethod = properties.breakMethod;

    beta=0.8;
    inputSize = 2;
    lrnStrategy=3;
    epochs=100;
    M = 9;
    H = 2;
    momentum=0;
    alpha=0.5;
    toReplace = floor(G*populationSize/2)*2;
    net = createNet(inputSize, M, H, lrnRate, lrnStrategy, momentum, alpha);
    net.amp = 1;
    net = getTrainSet(net, inFileOrOp);
    trainSet = net.trainSet;
    % Init population
    pop = cell(populationSize,1);
    for i = 1:populationSize
        sub.size = net.size;
        sub.Ws = (rand(net.size,1) - 0.5)*10;
        pop(i) = sub;
    end
    pop = updateFitness(net, pop, populationSize, txFun, beta);
    pop = setAccumFitness(pop, populationSize);
    pop = sortPopulation(pop, populationSize);
    lastGeneration = 0;
    fitnessArray = cell(generations,1);

            totalFit = pop{populationSize}.accumFitness;
            pop  = feval(replaceMethod, 10,pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, 1, totalFit, txFun, beta, net, 1, selMixCriteria, selMixN);

    for g = 1: generations
        lastGeneration = g;
        %calculo fitness + ordeno + total fitness
        totalFit = pop{populationSize}.accumFitness;

        %selecciono método de reemplazo
        pop  = feval(replaceMethod, epochs, pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit, txFun, beta, net, g, selMixCriteria, selMixN);

        pmut = mutAdaptation*pmut;

        pop = updateFitness(net, pop, populationSize, txFun, beta);
        pop = setAccumFitness(pop, populationSize);
        pop = sortPopulation(pop, populationSize);
        fit = pop{1}.fitness;
        aux.best = fit;
        aux.avg = pop{populationSize}.fitness/populationSize;
        fitnessArray(g) = aux;

        %Metodo de corte
        if strcmp(breakMethod, 'Estructura')
            if g > 5
                avgDiff = 0;
                for h = 1:5
                    avgDiff += fitnessArray{g-h}.avg;
                end
                avgDiff = avgDiff/5;
                if (avgDiff-fitnessArray{g}.avg)*fitnessArray{g}.avg<0.01
                    corte = 'Corta por estructura'
                    break;
                endif
            endif

        %Si no mejoro el mejor en 5 generaciones, termina   
        elseif strcmp(breakMethod, 'Contenido')
            if g > 5
                improved = false;
                for h = 1:5
                    if (!improved && fitnessArray{g}.best > fitnessArray{g-h}.best)
                        improved = true;
                    endif
                end 
                if !improved
                    corte = 'Corta por contenido'
                    break;
                endif
            endif

        elseif strcmp(breakMethod, 'Optimo')
            if fitnessArray{g}.best >= getFitnessFromError(minError)
                corte = 'Corta por estar cerca del optimo'
                break;
            endif   
        endif
    end
    net = putWs(net,pop{1}.Ws);

    bestFitnessArray = zeros(lastGeneration, 1);
    for i = 1:lastGeneration
        bestFitnessArray(i) = fitnessArray{i}.best  ;
    end
    subplot(1,1,1);
    plot(1:lastGeneration, bestFitnessArray, '-4; Fitness;');
endfunction
