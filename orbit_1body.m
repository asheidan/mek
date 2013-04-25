function [position,velocity,t]=orbit_1body(G,M,p0,v0,dt,tmax)
	masses = [M 1];
	gravitationalConstant = G;

	%gravitationalConstant = 6.67384E-11;

	numberOfSteps = floor(tmax/dt) + 1;
	t         = zeros(numberOfSteps,1);
	position  = zeros(numberOfSteps,2);
	velocity  = zeros(numberOfSteps,2);
	sateliteAcceleration = zeros(numberOfSteps,2);

	position(1,:) = p0;
	velocity(1,:) = v0;

	positions = [0 0 ; p0];
	tmp = calculateAccelerations(positions, masses, gravitationalConstant);
	sateliteAcceleration(1,:) = tmp(2,:);

	for s = 1:numberOfSteps-1
		t(s+1) = t(s) + dt;
		positions = [0 0 ; position(s,:)];
		accelerations = calculateAccelerations(positions, masses, gravitationalConstant);

		sateliteAcceleration(s,:) = accelerations(2,:);
		position(s+1,:) = position(s,:) + velocity(s,:)*dt + 0.5 * sateliteAcceleration(s,:) * (dt^2);
		velocity(s+1,:) = velocity(s,:) + 0.5 * (sateliteAcceleration(s+1,:) + sateliteAcceleration(s,:)) * dt;
	end
	

