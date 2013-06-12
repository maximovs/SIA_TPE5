function newPop = updateFitness(net, pop, populationSize, txFun, beta)
    for r = 1:populationSize
        net = putWs(net, pop{r}.Ws);
        net = calculateFitness(net,txFun,beta);
        pop{r}.fitness = net.fitness;
        pop{r}.avgError = net.avgError;
    end
    newPop = pop;
end