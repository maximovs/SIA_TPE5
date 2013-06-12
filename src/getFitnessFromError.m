function fitness = getFitnessFromError(avgError)
 	%avgError = avgError*avgError;
  fitness = 1/avgError;
end