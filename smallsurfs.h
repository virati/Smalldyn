#ifndef __SMALLSURF_H__
#define __SMALLSURF_H__

#include <cmath>

enum surf_type {
	line, tri, rect, cube, sphere;
};

class geo_surf {
public:
	surf();
	~surf();
	
	double get_norm();
	double get_center();
	
	
protected:
	
};

#endif
