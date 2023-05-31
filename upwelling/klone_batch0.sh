#!/bin/bash

## Job Name
#SBATCH --job-name=LiveOcean

## Resources
## Nodes
#SBATCH --nodes=1
## Tasks per node (Slurm assumes you want to run 28 tasks per node unless explicitly told otherwise)
#SBATCH --ntasks-per-node=4

## Walltime, maximum 24 hours
#SBATCH --time=00:20:00

## Memory per node
##SBATCH --mem=128G

##module purge
##module load intel/oneAPI
module load NiaEnv/2019b intel/2019u4 intelmpi/2019u4 hdf5/1.8.21 netcdf/4.6.3 subversion/1.10.4 sqlite/3.23.0

#NFDIR=/gscratch/macc/local/netcdf-ifort/
NFDIR=/scinet/intel/2019u4/compilers_and_libraries_2019.4.243/linux/bin/intel64/
export LD_LIBRARY_PATH=${NFDIR}/lib:${LD_LIBRARY_PATH}

RUN_DIR=/scratch/h/hansi/ryanarta/LO_roms_user/upwelling
mpirun -np 4 $RUN_DIR/romsM $RUN_DIR/roms_upwelling.in > $RUN_DIR/roms_log.txt

