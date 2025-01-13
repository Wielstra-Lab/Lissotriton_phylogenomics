#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --time=1-12:00:00
#SBATCH --partition=cpu_natbio
#SBATCH --output=output_%j.txt
#SBATCH --error=error_output_%j.txt
#SBATCH --job-name=invariant
#SBATCH --mail-type=ALL
#SBATCH --mail-user=

## Bash Script to loop python script

cd /data1/s2321041/Analyses/4.ASTRAL/4.2_vcf2phy

module load Python/3.11.3-GCCcore-12.3.0

for file in *.phy
do
python3 /home/s2321041/ascbias.py -p "$file" -o /data1/s2321041/Analyses/4.ASTRAL/4.3_RAxML/"${file%.phy}_unInv.phy"
done
