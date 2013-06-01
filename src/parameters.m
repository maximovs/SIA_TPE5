function parameters = parameters()
	parameters.inFileOrOp= 'TimeSerie_G7.mat';
	parameters.txFun= 'exponential';
	parameters.lrnRate= 0.8;
	parameters.populationSize= 20;
	parameters.generations= 20;
	parameters.G= 0.8;
	parameters.replaceMethod= 'rep1';
	parameters.selCriteria= 'Ruleta';
	parameters.repCriteria=	'Ruleta';
	parameters.crossover= 'Unif';
	parameters.pcross= 0.7;
	parameters.mutation= 'Classic1';
	parameters.pmut=	0.2;
	parameters.mutAdaptation= 1;
	parameters.pbackprop= 0.02;
endfunction