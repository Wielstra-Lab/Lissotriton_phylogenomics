#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --partition=cpu_natbio
#SBATCH --mem=20GB
#SBATCH --output=output_%j.txt
#SBATCH --error=error_output_%j.txt
#SBATCH --job-name=heatmap-Lisso
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kostersca@vuw.leidenuniv.nl

### This should load a version of Python 3 or higher:

module load ALICE/legacy
module load Python/3.7.4-GCCcore-8.3.0

cd /data1/s2321041/Lissotriton/DSuite/

# FOR FBRANCH heatmap (USES THE FBRANCH OUTPUT AND THE .nwk FILE WITH OUTGROUP)

python /data1/s2321041/Dsuite/utils/dtools.py output_fbranch.txt LissoAstral.nwk > figout.txt 2> figerr.txt
