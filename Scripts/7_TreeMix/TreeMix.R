## Script to plot output from treemix analysis by Manon de Visser

### More explanation in the following tutorials:
### Treemix Tutorial: https://speciationgenomics.github.io/Treemix/
### Wielstra lab Github banded newt paper: https://github.com/Wielstra-Lab/banded_newts
### OptM (https://cran.r-project.org/web/packages/OptM/readme/README.html)

setwd("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/TreeMix/")
#install.packages("RColorBrewer")
#install.packages("R.utils")
#install.packages("SiZer")
#install.packages("OptM")

library(RColorBrewer)
library(R.utils)
library(SiZer)
library(OptM)

### Adjusted plotting script mainly for the trees + residuals figures
source("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/TreeMix/plotting_funcs.R")

prefix="Lisso"

### Plot the 5 treemix runs side-by-side for one of the reticulations (in example below, the 10th)

par(mfrow=c(2,3))
for(edge in 1:5){
  plot_tree(cex=0.8,paste0(prefix,".1.",edge))
  title(paste(edge,"edges"))
}
#dev.off()

### Check which parts of the tree are not well modelled (by plotting the residuals)

par(mfrow=c(2,3))
for(edge in 1:5){
  plot_resid(stem=paste0(prefix,".10.",edge),pop_order="pop.list")
}
#dev.off()


### Second Adjusted plotting script mainly for the deltam / optM figures

source("C:/Users/steph/OneDrive/Documenten/Analyses/Lissotriton/TreeMix/plotting_funcs2.R")


## Use OptM to estimate the optimal number of migration events/edges, in different ways:
## I have used the extdata folder throughout the process 

#!!!! (thus deleting/moving the example files from OptM and replacing them with my own input files!!!!)

# 1) by using the Evanno-like method / ad hoc statistic
folder <- system.file("extdata", package = "OptM")
test.optM = optM(folder)
plot_optM(test.optM, method = "Evanno", pdf = "Evanno.pdf")
dev.off()

# 2) or by using the linear modeling estimation method
folder <- system.file("extdata", package = "OptM")
test.linear = optM(folder, method = "linear")
plot_optM(test.linear, method = "linear", pdf = "Linear.pdf")
dev.off()

# 3) or by using SiZer
folder <- system.file("extdata", package = "OptM")
test.sizer = optM(folder, method = "SiZer")
plot_optM(test.sizer, method = "SiZer", pdf = "SiZer.pdf")
dev.off()
