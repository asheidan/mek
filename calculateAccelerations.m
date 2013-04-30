function accelerations = calculateAccelerations(positions, masses, gravitationalConstant)
	[numberOfBodies,numberOfDimensions] = size(positions);

	magicConstant = - gravitationalConstant / 2.0;

	differenceVectors = calculateDifferenceVectors(positions);
	distanceVectors = differenceVectors.^2; % rename difference per axis squared
	distances = sqrt(sum(distanceVectors, 3));
	distances += eye(numberOfBodies); % enable us to divide by distance

	distanceCube = distances.^3;
	
	%distanceCube += eye(numberOfBodies);

	accelerations = zeros(numberOfBodies,numberOfDimensions);
	for dimension = 1:numberOfDimensions
		tmp1 = gravitationalConstant * masses;
		tmp2 = differenceVectors(:,:,dimension);
		accelerations(:,dimension) = tmp1 * (tmp2 ./ distanceCube);
	end

	global potentialEnergy = zeros(numberOfBodies,1);
	massMatrix = masses' * masses;
	% distances
	massMatrix(logical(eye(numberOfBodies))) = 0;
	% massMatrix
	potentialEnergy = magicConstant * sum((massMatrix ./ distances),1);
