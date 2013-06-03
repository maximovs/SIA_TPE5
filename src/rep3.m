function newPop = rep3(epochs, pop,populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit, txFun, beta, net, generation, selMixCriteria, selMixN)
	K = toReplace;
    mediumPop = cell(populationSize+K,1);
    for i=1:populationSize
        mediumPop{i} = pop{i};
    end
    %selecciono los K elementos
    sel = feval(strcat('sel', selCriteria), pop, populationSize, K, totalFit, generation, selMixN, selMixCriteria);

    for i=1:K/2
        aux = cell(2,1);
        aux{1} = sel{i*2-1};
        aux{2} = sel{i*2};

        if(rand(1,1)<=pcross)
            %se produce el cross
            aux = feval(strcat('cross', crossover),aux);
        endif
        %se muta
        aux{1} = feval(strcat('mut', mutation), aux{1}, pmut);
        aux{2} = feval(strcat('mut', mutation), aux{2}, pmut);

        
    	sel{i*2-1} = aux{1};
    	sel{i*2} = aux{2};
    end
    for i=1:K
        mediumPop{populationSize+i} = sel{i};
    end
    %se backtrackea
    for j=populationSize+1:populationSize+K
        if(rand(1,1)<pbackprop)
            mediumPop{j} = backProp(mediumPop{j},txFun,beta,net, epochs);
        endif
    end
%---
   totalFit = 0;
        for r = 1:populationSize+K
            net = putWs(net, mediumPop{r}.Ws);
            net = calculateFitness(net,txFun,beta);
            mediumPop{r}.fitness = net.fitness;
        end
        mediumPop = sortPopulation(mediumPop, populationSize+K);
        fit = mediumPop{1}.fitness;
        for r = 1:populationSize+K
            totalFit += mediumPop{r}.fitness;
            mediumPop{r}.accumFitness = totalFit;
        end
    mediumPop = sortPopulation(mediumPop, populationSize+K);
%---
    %se eligen los N de los N+K
    newPop = feval(strcat('sel', selCriteria), mediumPop, populationSize+K, populationSize, totalFit, generation, selMixN, selMixCriteria);
endfunction