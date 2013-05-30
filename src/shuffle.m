function res = shuffle(trainSet)
	res = cell(size(trainSet,1),2);
	index = randperm(size(trainSet,1))';
	for i = 1:size(index,1)
		res{i}{1} = trainSet{index(i)}{1};
		res{i}{2} = trainSet{index(i)}{2};  
	end
endfunction