function out - tester()
	params = parameters();
	populationSize = cell(3,1);
	populationSize{1} = 20;
	populationSize{2} = 30;
	populationSize{3} = 100;

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


	parameters.populationSize= 20;
	parameters.generations= 50;
	parameters.G= 0.8; %Porcentaje de problacion a reemplazar
	parameters.replaceMethod= 'rep3'; % rep1 | rep2 | rep3
	parameters.selCriteria= 'Boltzman'; %    Mix | Elite | Boltzman | Ruleta | Torneos | Universal
	parameters.repCriteria=	'Ruleta'; % Mix | Elite | Boltzman | Ruleta | Torneos | Universal
	parameters.crossover= 'Unif'; % 2Points | Anular | Classic | Unif
	parameters.pcross= 0.7;
	parameters.mutation= 'Classic2'; %Classic1 | Classic2
	parameters.pmut=0.05;
	parameters.mutAdaptation= 1;
	parameters.pbackprop= 0.05;
	parameters.selMixCriteria= 'Ruleta';
	parameters.selMixN= 4;

	params = parameters();
	repComp = cell(3,1);
	for i=1:3
		params.replaceMethod=replaceMethod{i};
		repComp{i} = gamain(parameters);
	end
	save('repComp.mat',repComp);
	
	params = parameters();
	populationSizeComp = cell(3,1);
	for i=1:3
		params.populationSize=populationSize{i};
		populationSizeComp{i} = gamain(params);
	end
	save('populationSizeComp.mat',populationSizeComp);
	
	params = parameters();
	generationsComp = cell(3,1);
	for i=1:3
		params.generations=generations{i};
		generationsComp{i} = gamain(params);
	end
	save('generationsComp.mat',generationsComp);

	params = parameters();
	GComp = cell(3,1);
	for i=1:3
		params.G=G{i};
		GComp{i} = gamain(params);
	end
	save('GComp.mat',GComp);


	params = parameters();
	selCriteriaComp = cell(5,1);
	for i=1:5
		params.selCriteria=selCriteria{i};
		selCriteriaComp{i} = gamain(params);
	end
	save('selCriteriaComp.mat',selCriteriaComp);

	params = parameters();
	repCriteriaComp = cell(5,1);
	for i=1:5
		params.repCriteria=repCriteria{i};
		repCriteriaComp{i} = gamain(params);
	end
	save('repCriteriaComp.mat',repCriteriaComp);

	params = parameters();
	crossoverComp = cell(4,1);
	for i=1:4
		params.crossover=crossover{i};
		crossoverComp{i} = gamain(params);
	end
	save('crossoverComp.mat',crossoverComp);


	params = parameters();
	pcrossComp = cell(3,1);
	for i=1:3
		params.pcross=pcross{i};
		pcrossComp{i} = gamain(params);
	end
	save('pcrossComp.mat',pcrossComp);

	params = parameters();
	mutationComp = cell(2,1);
	for i=1:2
		params.mutation=mutation{i};
		mutationComp{i} = gamain(params);
	end
	save('mutationComp.mat',mutationComp);

	params = parameters();
	pmutComp = cell(2,1);
	for i=1:2
		params.pmut=pmut{i};
		pmutComp{i} = gamain(params);
	end
	save('pmutComp.mat',pmutComp);

	params = parameters();
	mutAdaptationComp = cell(2,1);
	for i=1:2
		params.mutAdaptation=mutAdaptation{i};
		mutAdaptationComp{i} = gamain(params);
	end
	save('mutAdaptationComp.mat',mutAdaptationComp);

	params = parameters();
	pbackpropComp = cell(2,1);
	for i=1:2
		params.pbackprop=pbackprop{i};
		pbackpropComp{i} = gamain(params);
	end
	save('pbackpropComp.mat',pbackpropComp);

	params = parameters();
	selMixCriteriaComp = cell(2,1);
	for i=1:2
		params.selMixCriteria=selMixCriteria{i};
		selMixCriteriaComp{i} = gamain(params);
	end
	save('selMixCriteriaComp.mat',selMixCriteriaComp);

	params = parameters();
	selMixNComp = cell(2,1);
	for i=1:2
		params.selMixN=selMixN{i};
		selMixNComp{i} = gamain(params);
	end
	save('selMixNComp.mat',selMixNComp);

endfunction