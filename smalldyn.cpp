#include <iostream>
#include <cmath>

#include "smallsys.h"
#include "smallsys.cuh"
#include "small_kernels.cuh"

using namespace std;

smallsys *simsys = 0;
bool done = false;
simParams default_params;

void init_system(simParams *targets) { //int n_particles, float end_time, float time_step) {
	simsys = new smallsys(targets);
}

void generate_parameters(simParams *targets) {
	targets->N_total_particles = 10;
	targets->time_end = 1;
	targets->time_step = 0.1;
}

int main(int argc, char *argv[]) {
	int arb_input;
	
	cout << "Hello World!" << endl;
	
	generate_parameters(&default_params);
	init_system(&default_params);
	
	
	cout << simsys->get_num_particles() << endl;
	
	while(!done) {
		simsys->do_timestep();
		cout << "Clock: " << simsys->get_clock() << endl;
		cin >> arb_input;
		cout << endl;
	}
	
	return 0;	
}

