#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH --partition=cpu_natbio
#SBATCH --mem=20GB
#SBATCH --output=output_%j.txt
#SBATCH --error=error_output_%j.txt
#SBATCH --job-name=DSuite-Lisso
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kostersca@vuw.leidenuniv.nl

cd /data1/s2321041/Lissotriton/DSuite/

# FOR DTRIOS WITH TREE (USES AN OUTGROUP)
/data1/s2321041/Dsuite/Build/Dsuite Dtrios --tree=LissoAstral.nwk LissOut.g.vcf LissOut.txt
