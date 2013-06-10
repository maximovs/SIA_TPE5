function out = tester8()
	params = parameters();
	populationSize = cell(4,1);
	populationSize{1} = 20;
	populationSize{2} = 30;
	populationSize{3} = 100;
	populationSize{4} = 150;

	generations = cell(3,1);
	generations{1} = 20;
	generations{2} = 40;
	generations{3} = 100;

	G = cell(3,1);
	G{1} = 0.7;
	G{2} = 0.8;
	G{3} = 1;

	replaceMethod = cell(3,1);
	replaceMethod{1} = 'rep1';
	replaceMethod{2} = 'rep2';
	replaceMethod{3} = 'rep3';

	selCriteria = cell(5,1);
	selCriteria{1} = 'Mix';
	selCriteria{2} = 'Elite';
	selCriteria{3} = 'Boltzman';
	selCriteria{4} = 'Ruleta';
	selCriteria{5} = 'Torneos';

	repCriteria = cell(5,1);
	repCriteria{1} = 'Mix';
	repCriteria{2} = 'Elite';
	repCriteria{3} = 'Boltzman';
	repCriteria{4} = 'Ruleta';
	repCriteria{5} = 'Torneos';

	crossover = cell(4,1);
	crossover{1} = '2Points';
	crossover{2} = 'Anular';
	crossover{3} = 'Classic';
	crossover{4} = 'Unif';

	pcross = cell(3,1);
	pcross{1} = 0.5;
	pcross{2} = 0.7;
	pcross{3} = 0.85;

	mutation = cell(2,1);
	mutation{1} = 'Classic1';
	mutation{2} = 'Classic2';

	pmut = cell(2,1);
	pmut{1} = 0.05;
	pmut{2} = 0.1;

	mutAdaptation = cell(2,1);
	mutAdaptation{1} = 1;
	mutAdaptation{2} = 0.95;

	pbackprop = cell(2,1);
	pbackprop{1} = 0.01;
	pbackprop{2} = 0.05;

	selMixCriteria = cell(2,1);
	selMixCriteria{1} = 'Ruleta';
	selMixCriteria{2} = 'Universal';

	selMixN = cell(2,1);
	selMixN{1} = 4;
	selMixN{1} = 8;

%	parameters.inFileOrOp= 'TimeSerie_G7.mat';
%	parameters.txFun= 'exponential';
%	parameters.lrnRate= 0.8;
%	parameters.populationSize= 20;
%	parameters.generations= 50;
%	parameters.G= 0.8; %Porcentaje de problacion a reemplazar
%	parameters.replaceMethod= 'rep3'; % rep1 | rep2 | rep3
%	parameters.selCriteria= 'Boltzman'; %    Mix | Elite | Boltzman | Ruleta | Torneos | Universal
%	parameters.repCriteria=	'Ruleta'; % Mix | Elite | Boltzman | Ruleta | Torneos | Universal
%	parameters.crossover= 'Unif'; % 2Points | Anular | Classic | Unif
%	parameters.pcross= 0.7;
%	parameters.mutation= 'Classic2'; %Classic1 | Classic2
%	parameters.pmut=0.05;
%	parameters.mutAdaptation= 1;
%	parameters.pbackprop= 0.05;
%	parameters.selMixCriteria= 'Ruleta';
%	parameters.selMixN= 4;
%	parameters.minError = 0.01;
%	parameters.breakMethod = 'Optimo';

	params = parameters();
	params.pbackprop = 0;
	params.populationSize = 100;
	params.generations = 150;
	noBackPropComp = gamain(params);
	save('noBackPropComp.mat', 'noBackPropComp');

endfunction
