#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --partition=cpu-long
#SBATCH --output=output_%j.txt
#SBATCH --time=1-00:00:00
#SBATCH --mem=100GB
#SBATCH --error=error_output_%j.txt
#SBATCH --job-name=Lissotriton
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kostersca@vuw.leidenuniv.nl

cd /data1/s2321041/Lissotriton/

module load skewer
module load VCFtools
module load BWA
module load SAMtools
module load picard

perl /data1/s2321041/Lissotriton/Scripts/1_Master_BQSR.pl
