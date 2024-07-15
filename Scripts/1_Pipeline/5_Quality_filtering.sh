#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --partition=cpu_natbio
#SBATCH --output=output_%j.txt
#SBATCH --time=0-01:00:00
#SBATCH --error=error_output_%j.txt
#SBATCH --job-name=quality_filtering
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kostersca@vuw.leidenuniv.nl

cd /data1/s2321041/Lissotriton/variants

module load VCFtools

vcftools --vcf Lissotriton_Exchet.vcf --max-missing 1 --remove-indels --minQ 20 --recode --recode-INFO-all --out Lisso1

perl /data1/s2321041/Lissotriton/Scripts/5_SNP_Subset.pl Lisso1.recode.vcf Lisso1_SNPs_Subset.vcf
