function net = gamain(properties)
    % properties = parameters();
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
        sub.Ws = (rand(net.size,1) - 0.5)*20;
        pop(i) = sub;
    end
    pop = updateFitness(net, pop, populationSize, txFun, beta);
    pop = sortPopulation(pop, populationSize);
    pop = setAccumFitness(pop, populationSize);
    lastGeneration = 0;
    fitnessArray = cell(generations,1);

    bestFitnessArray = zeros(1, 1);
    subplot(1,1,1);
    f = plot(bestFitnessArray, '-2; Best fitness;', bestFitnessArray, '-4; AVG fitness;', bestFitnessArray, '-1; Worst fitness;');

    for g = 1: generations
        lastGeneration = g;
        %calculo fitness + ordeno + total fitness
        totalFit = pop{populationSize}.accumFitness;

        %selecciono método de reemplazo
        pop  = feval(replaceMethod, epochs, pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit, txFun, beta, net, g, selMixCriteria, selMixN);

        pmut = mutAdaptation*pmut;

        pop = updateFitness(net, pop, populationSize, txFun, beta);
        pop = sortPopulation(pop, populationSize);
        pop = setAccumFitness(pop, populationSize);
        fit = pop{1}.fitness;
        aux.best = fit;
        aux.avg = 0;
        for i = 1:populationSize
            aux.avg = aux.avg + pop{i}.fitness;
        end
        aux.avg = aux.avg / populationSize;
        aux.worst = 99999999;
        for i = 1:populationSize
            if pop{i}.fitness < aux.worst
                aux.worst = pop{i}.fitness;
            endif
        end
        fitnessArray(g) = aux;

        %Metodo de corte
        if strcmp(breakMethod, 'Estructura')
            if g > 5
                improved = false;
                for h = 1:5
                    if (!improved && fitnessArray{g}.avg > fitnessArray{g-h}.avg*1.05)
                        improved = true;
                    endif
                end 
                if !improved
                    corte = 'Corta por estructura'
                    break;
                endif
            endif

        %Si no mejoró el mejor en 5 generaciones, termina   
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

        bestFitnessArray = zeros(lastGeneration+1, 1);
        avgFitnessArray = zeros(lastGeneration+1, 1);
        worstFitnessArray = zeros(lastGeneration+1, 1);
        for i = 1:lastGeneration
            bestFitnessArray(i+1) = fitnessArray{i}.best;
            avgFitnessArray(i+1) = fitnessArray{i}.avg;
            worstFitnessArray(i+1) = fitnessArray{i}.worst;
        end

        set(f,'XData',[0:lastGeneration])
        set(f(1),'YData', bestFitnessArray)
        set(f(2),'YData', avgFitnessArray)
        set(f(3),'YData', worstFitnessArray)
        refreshdata
        drawnow



    end
    net = putWs(net,pop{1}.Ws);
    net.avgError = pop{1}.avgError;
    net.fitness = pop{1}.fitness;
endfunction
