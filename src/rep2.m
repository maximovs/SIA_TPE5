function newPop = rep2(epochs, pop, populationSize, toReplace, selCriteria, repCriteria, crossover, pcross, mutation, pmut, pbackprop, totalFit, txFun, beta, net, generation, selMixCriteria, selMixN)
    K = toReplace;
    if rem(K, 2) == 1
        K = K-1;
    endif
    children = cell(K,1);
    sel = cell(2,1);
    %selecciono K con algún método.
    parents = feval(strcat('sel', selCriteria), pop, populationSize, K, totalFit, generation, selMixN, selMixCriteria);
    for i = 1:K/2
        sel{1}=parents{i*2-1};
        sel{2}=parents{i*2};
        %se produce el cross
        if(rand(1,1)<=pcross)
   	        sel = feval(strcat('cross', crossover),sel);
        endif
        children{i*2-1} = sel{1};
        children{i*2} = sel{2};
    end 

    for i = 1:K
        %Se muta    
        if (rand(1,1)<pmut)
            children{i} = feval(strcat('mut', mutation), children{i}, pmut);
        endif
        %Se backpropaguea
        if(rand(1,1)<pbackprop)
            children{i} = backProp(children{i},txFun,beta,net, epochs);
        endif
    end
    survivors = feval(strcat('sel', selCriteria), pop, populationSize, populationSize-K, totalFit, generation, selMixN, selMixCriteria);
    newPop = [children; survivors];
endfunction
