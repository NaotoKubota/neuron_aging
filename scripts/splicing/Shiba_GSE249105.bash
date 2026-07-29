#!/bin/bash -l

########################################################################################

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --mail-user=the.owner.of.the.dream123@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name="Shiba GSE249105"
#SBATCH -p epyc

# Print current date
date

########################################################################################


# Load module
module load singularity snakemake


# Run snakemake
snakemake \
-s /rhome/naotok/bigdata/Shiba/stable_release/Shiba/snakeshiba.smk \
--configfile config_Shiba_GSE249105.yaml \
--cores 32 \
--use-singularity \
--singularity-args "--bind $HOME:$HOME" \
--rerun-incomplete


# Print end date
date


# Print name of node
hostname
