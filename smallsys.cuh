extern "C" {
	void cudaInit(int argc, char **argv);
	
	void allocate_array(void **ptr, int size);
	void free_array(void *ptr);
	
	void diffuse(uint num_total_particles, float time_step, coord *h_pos);
}
