function net = main(beta,inputSize,op,txFun,lrnRate, epochs)
    trainSet = feval(strcat(op, num2str(inputSize)));
    W = rand(inputSize+1,1);
%W = zeros(inputSize+1,1);
for j = 1:epochs
    for i = 1:size(trainSet)

    %calculas los o de cada capa
    o = feval(txFun,[-1 trainSet{i}{1}]*W,beta);
    %calculas los delta de cada capa
    dW = [-1 trainSet{i}{1}]*lrnRate*(trainSet{i}{2} - o);
    %updateas los valores de cada capa
    W = W+dW';
    end
end

net.W = W;
net.trainSet = trainSet;
endfunction