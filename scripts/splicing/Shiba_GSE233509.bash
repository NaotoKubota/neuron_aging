#!/bin/bash -l

########################################################################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --mail-user=the.owner.of.the.dream123@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="Shiba GSE233509"
#SBATCH -p epyc

# Print current date
date

########################################################################################


# Load module
module load singularity snakemake


# Run snakemake
for cell in Neuron Astrocyte;
do
	for tissue in Cortex Cerebellum;
	do
		snakemake \
		-s /rhome/naotok/bigdata/Shiba/stable_release/Shiba/snakeshiba.smk \
		--configfile config_Shiba_GSE233509.yaml \
		--config \
		workdir=/rhome/naotok/bigdata/neuron_aging/GEO_SRA/GSE233509/Shiba/${cell}_${tissue} \
		reference_group=${cell}_${tissue}_4m \
		alternative_group=${cell}_${tissue}_2y \
		--cores 32 \
		--use-singularity \
		--singularity-args "--bind $HOME:$HOME" \
		--rerun-incomplete
	done
done

# Print end date
date


# Print name of node
hostname
