#!/bin/bash -l

#####################################################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --mail-user=the.owner.of.the.dream123@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="Fetch GSE233509"
#SBATCH -p epyc

# Print current date
date

#####################################################################


# load modules
module load singularity


# ngsfetch
singularity exec docker://naotokubota/ngsfetch:v0.1.1 \
ngsfetch -i GSE233509 -o /rhome/naotok/bigdata/neuron_aging/GEO_SRA/GSE233509 -p 16 --attempts 10


# Print end date
date


# Print name of node
hostname
