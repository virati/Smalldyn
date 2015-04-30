#ifndef __SMALLDYN_H__
#define __SMALLDYN_H__

typedef unsigned int uint;

enum species {
	glutamate,
	NR2A,
	NR2B,
	AR1,
	AR2
};

enum surface {
	PRESYN,
	POSTSYN,
	Pr_ESYN,
	Po_ESYN,
	
};

struct coord{
	float x,y,z;
};

//Simulation Stuff

struct simParams {
	int N_total_particles;
	float time_end;
	float time_step;	
};

#endif
