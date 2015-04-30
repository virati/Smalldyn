nCC = nvcc
nFLAGS = -arch sm_13 --ptxas-options=-v
CC = gcc
comp_bin_dir =--compiler-bindir=/usr/bin/g++-3.4
nCFLAGS = "-Wall -fno-inline -g -pg"
CFLAGS=-Wall -fno-inline -g -pg
INCLUDES = -I/usr/include -I/usr/share/cuda-sdk/C/common/inc
LDFLAGS=-L/usr/share/cuda-sdk/C/lib -L/usr/share/cuda-sdk/C/common/lib/linux/
LIB= -lcuda -lcudart
SOURCES = smalldyn.cpp smallsys.cpp smallsyscu.cu
OBJECTS = smalldyn.o smallsys.o smallsyscu.o
TARGET := smalldyn

all : $(TARGET)

#dyn.o : dyn.cu
#	$(nCC) $(nFLAGS) $(comp_bin_dir) --compiler-options $(nCFLAGS) $(INCLUDES) -o $@ -c $^

#smallsyscu.o : smallsys.cu
#	$(nCC) $(nFLAGS) $(comp_bin_dir) --compiler-options $(nCFLAGS) $(INCLUDES) -o $@ -c $^

%.o : %.cu
	$(nCC) $(nFLAGS) $(comp_bin_dir) --compiler-options $(nCFLAGS) $(INCLUDES) -o $@ -c $^
	
%.o : %.c
	$(CC) -c $^ $(CFLAGS) $(INCLUDES) -o $@

clean:
	rm -f *.o $(target)
	
$(TARGET): $(OBJECTS)
	$(CC) -pg $(LDFLAGS) $(LIB) $(INCLUDES) -o $@ $(OBJECTS)
