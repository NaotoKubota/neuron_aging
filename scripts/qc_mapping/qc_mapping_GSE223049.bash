#!/bin/bash -l

#####################################################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=80G
#SBATCH --mail-user=the.owner.of.the.dream123@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="QC mapping GSE223049"
#SBATCH -p epyc

# Print current date
date

#####################################################################


# load modules
module load singularity snakemake


# Run preprocessing_RNAseq.smk
snakemake -s /rhome/naotok/bigdata/SnakeNgs/snakefile/preprocessing_RNAseq.smk \
--configfile config_GSE223049.yaml \
--cores 64 \
--use-singularity \
--singularity-args "--bind $HOME:$HOME" \
--rerun-incomplete


# Print end date
date


# Print name of node
hostname
