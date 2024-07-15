###Script written by Peter Scott UCLA

#set working directory
setwd("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA")
getwd()

#install.packages("ggplot2")
#if (!requireNamespace("BiocManager", quietly = TRUE))
  #install.packages("BiocManager")
#BiocManager:::install("gdsfmt")
#BiocManager:::install("SNPRelate")
library("tidyverse")
library("ggplot2")
library("rlang")
library(gdsfmt)
library(SNPRelate)
library(ggplot2)
library(RColorBrewer)
library(cowplot)
library(ggrepel)
library(wesanderson)

vcf_ERC_Comb_rawgvcf <- "C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA/Lissotriton.g.vcf"

snpgdsVCF2GDS(vcf_ERC_Comb_rawgvcf, "C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA/Lissotritonvcf.gds", method="biallelic.only")

snpgdsSummary("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA/Lissotritonvcf.gds")

vcf_ERC_Comb_allrawgvcf_gds<- snpgdsOpen("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA/Lissotritonvcf.gds")

###new try phylogeny
set.seed(100)

par(mar=c(4,1,1,1))
par("mar")

#dissimilarity matrix
trial_dissim <- snpgdsHCluster(snpgdsIBS(vcf_ERC_Comb_allrawgvcf_gds,num.thread=2,autosome.onl=FALSE))
#maketree
cut_tree <- snpgdsCutTree(trial_dissim)
cut_tree
#save dendogram
dendogram = cut_tree$dendrogram

dendogram

snpgdsDrawTree(cut_tree,clust.count=NULL,dend.idx=NULL,
               type=c("dendrogram", "z-score"), yaxis.height=TRUE, yaxis.kinship=TRUE,
               y.kinship.baseline=NaN, y.label.kinship=FALSE, outlier.n=NULL,
               shadow.col=c(rgb(0.5, 0.5, 0.5, 0.25), rgb(0.5, 0.5, 0.5, 0.05)),
               outlier.col=rgb(1, 0.50, 0.50, 0.5), leaflab="perpendicular",
               labels=NULL, y.label=0.2)
plot(cut_tree$dendogram,horiz=T,main="trial dendogram SNP Tree")

###PCA
pca_vcf_ERC_Comb_allrawgvcf <- snpgdsPCA(vcf_ERC_Comb_allrawgvcf_gds, autosome.only = FALSE)
pca_vcf_ERC_Comb_allrawgvcf
pc.percent <- pca_vcf_ERC_Comb_allrawgvcf$varprop*100
(round(pc.percent, 2))

tab <- data.frame(sample.id = pca_vcf_ERC_Comb_allrawgvcf$sample.id,
                  EV1 = pca_vcf_ERC_Comb_allrawgvcf$eigenvect[,1], # the first eigenvector
                  EV2 = pca_vcf_ERC_Comb_allrawgvcf$eigenvect[,2], # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

vcf_ERC_Comb_allrawgvcf_names<-read.csv("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/PCA/List.txt",sep="\t")
head(vcf_ERC_Comb_allrawgvcf_names)

##plot PCA with no colors
plot(tab$EV2, tab$EV1, xlab="eigenvector 2", ylab="eigenvector 1")

####This is for Ben's PC1-2 and PC1-3 plots with 4 or 8 colors

pop=vcf_ERC_Comb_allrawgvcf_names$pop.code
sp=vcf_ERC_Comb_allrawgvcf_names$sp.code
cat=vcf_ERC_Comb_allrawgvcf_names$cat.code

### PCA

tab1 <- data.frame(Species = vcf_ERC_Comb_allrawgvcf_names$sample.number,
                    EV1 = pca_vcf_ERC_Comb_allrawgvcf$eigenvect[,1], # the first eigenvector
                    EV2 = pca_vcf_ERC_Comb_allrawgvcf$eigenvect[,2], # the second eigenvector
                    key = pop)

#Choose: 1st = all labels, 2nd is only a few/not too much overlapping
options(ggrepel.max.overlaps = Inf)

sp.colors19<-c("cyan", "rosybrown2", "darkblue","burlywood1", "hotpink", "blue", "cadetblue4", "firebrick4", "wheat1", "tan4", "forestgreen", "green", "yellow2", "chocolate2", "yellow2", "chartreuse1", "cadetblue4", "grey64", "burlywood")

gplot1 <- ggplot(tab1, aes(EV1,EV2,color=Species)) + geom_point(size=3) +
  scale_color_manual(values = sp.colors19) + 
  #geom_text(aes(label=vcf_ERC_Comb_testallrawgvcf_names$pop.code), size=3) +
  xlab("PC1 (14.69%)") +
  ylab("PC2 (10.97%)") +
  theme_bw() 

gplot1
