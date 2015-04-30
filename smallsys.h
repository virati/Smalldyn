#ifndef __SMALLSYS_H__
#define __SMALLSYS_H__

#include "smalldyn.h"

class smallsys {
public:
	smallsys(simParams *targets);
	~smallsys();
	
	//Functions
	//Returns the number of particles
	int get_num_particles();
	//Increments the time
	float time_increment();
	//Does a timestep
	void do_timestep();
	//Get time
	float get_clock();
	//Reset Particle Positions
	void reset_particle_positions();
	
	void _initialize();
	

protected:
	bool in_progress;
	
	//Variables
	//Total Number of Particles
	uint num_total_particles;
	float time_end;
	float current_t;
	float time_step;

	//Host Stuff
	coord *h_pos;
	
	//Device Stuff
	double *d_pos;
};

#endif
