G = 6.67384E-11;
M = 5.972E24;
masses = [
	1.989E30
	5.5E-2 * M
	8.15E-1 * M
	1 * M
	1.07E-1 * M
]';
Au = 1.49597871E11;
p0 = [
	0 0
	0 4E-1 * Au
	0 7E-1 * Au
	0 1 * Au
	0 1.5 * Au
];
v0 = [
	0 0
	4.787E4 0
	3.502E4 0
	2.978E4 0
	2.4077E4 0
];

dt = 1E3;
tmax = 60*60*24*365.25 / 2;

hold off;

[p,v,t] = orbit_Nbody(G, masses, p0,v0, dt,tmax);
%size(p)
xs = rotdim(p(:,1,:));
ys = rotdim(p(:,2,:));
plot( xs,ys );
legend('Solen','Merkurius','Venus','Jorden','Mars');
