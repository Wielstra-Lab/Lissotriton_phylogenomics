[Input files containing the ML trees]
#treefile = /data1/s2321041/Lissotriton/treePL/Lisso_Full.tre
treefile = /data1/s2321041/Lissotriton/treePL/RAxML_bootstrap.LissoBoot.tre

[General commands]
numsites = 344258
nthreads = 4
thorough
log_pen

[Calibrations]
mrca = m1 1995_Triturus_marmoratus 3247_Triturus_macedonicus
mrca = m2 312_Triturus_carnifex 3247_Triturus_macedonicus
min = m1 24
min = m2 5.33
max = m1 24
max = m2 5.33

[Priming command]
#prime

[Best optimisation parameters]
opt = 3
moredetail
optad = 3
moredetailad
optcvad = 5

[Cross-validation analysis]
#randomcv
#cviter = 5
#cvsimaniter = 1000000000
#cvstart = 0.0001
#cvstop = 0.00000000000000000000000000001
#cvmultstep = 0.1
#cvoutfile = /data1/s2321041/Lissotriton/treePL/randomcv7_Lisso.txt

[Best smoothing value]
#smooth = 0.000000001

[Output file of dating step]
outfile = /data1/s2321041/Lissotriton/treePL/Lisso_treePL_dated.tre
