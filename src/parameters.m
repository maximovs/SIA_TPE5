function parameters = parameters()
	parameters.inFileOrOp= 'TimeSerie_G7.mat';
	parameters.txFun= 'exponential';
	parameters.lrnRate= 0.8;
	parameters.populationSize= 30;
	parameters.generations= 50;
	parameters.G= 0.8; %Porcentaje de problacion a reemplazar
	parameters.replaceMethod= 'rep1'; % rep1 | rep2 | rep3
	parameters.selCriteria= 'Elite'; %    Mix | Elite | Boltzman | Ruleta | Torneos | Universal
	parameters.repCriteria=	'Ruleta'; % Mix | Elite | Boltzman | Ruleta | Torneos | Universal
	parameters.crossover= 'Unif'; % 2Points | Anular | Classic | Unif
	parameters.pcross= 0.7;
	parameters.mutation= 'Classic2'; %Classic1 | Classic2
	parameters.pmut=0.05;
	parameters.mutAdaptation= 1;
	parameters.pbackprop= 0.02;
	parameters.selMixCriteria= 'Ruleta';
	parameters.selMixN= 4;
	parameters.minError = 0.01;
	parameters.breakMethod = 'Optimo';
endfunction