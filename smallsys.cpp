//#include <iostream>
#include "smallsys.h"
#include "smallsys.cuh"
#include "small_kernels.cuh"

smallsys::smallsys(simParams *targets) {
	num_total_particles = targets->N_total_particles;
	time_end = targets->time_end;
	time_step = targets->time_step;
	
	h_pos = new coord[num_total_particles * 3];
	reset_particle_positions();
	
	in_progress = true;
}

smallsys::~smallsys() {
	delete [] h_pos;
}

int smallsys::get_num_particles() {
	return num_total_particles;
}

float smallsys::time_increment() {
	current_t += time_step;
	return current_t;
}

void smallsys::do_timestep() {
	if(!in_progress){return;}
	
	diffuse(num_total_particles, time_step, h_pos);
	
	if(time_increment() > time_end) {
		in_progress = false;
	}
}

void smallsys::_initialize() {
	
}

void smallsys::reset_particle_positions() {
	for(int i = 0; i < num_total_particles; i++) {
		h_pos[i].x = 0;
		h_pos[i].y = 0;
		h_pos[i].z = 0;
	}
}

float smallsys::get_clock() {
	return current_t;
}
