# Chargement des données COST SUMARiS (depuis fichiers CSV)
#
# Benoit Lavenier <benoit.lavenier@e-is.pro>
# Hélène Gadenne
#

library(COSTcore)

# SUMARIS
#Path <- '/home/blavenie/Documents/sih/COST/data/COST_SUMARIS/TU_01/'
Path <- '/media/data/home/blavenie/Documents/sih/COST/data/COST_SUMARIS/PROD/'
#Path <- '/media/data/home/blavenie/Documents/sih/COST/data/COST_SUMARIS/PROD_DATA_CALL/'
setwd(Path)

#Importations des tables
COST.TR <- read.table('TR.csv',header=TRUE, sep=';')
COST.HH <- read.table('HH.csv',header=TRUE, sep=';')
COST.SL <- read.table('SL.csv',header=TRUE, sep=';')
COST.HL <- read.table('HL.csv',header=TRUE, sep=';')
COST.CL <- read.table('CL.csv',header=TRUE, sep=';')

# Create the csData object
COST <- csData(tr=COST.TR[,-1], hh=COST.HH[,-1], sl=COST.SL[,-1], hl=COST.HL[,-1], cl=COST.CL[,-1])

# IF ERROR:
# - check column format and order
# - check there is duplication
#duplicated(COST.SL)
#COST.SL <- unique(COST.SL)

library(COSTeda)

cstSummary(COST, tab="tr", sizeMax=10, except="date")
cstSummary(COST, tab="hh", sizeMax=10, except="date")
cstSummary(COST, tab="sl", sizeMax=10, except="date")
cstSummary(COST, tab="hl", sizeMax=10, except="date")
cstSummary(COST, tab="cl", sizeMax=10, except="date")

temp <- save(COST, file='SUMARiS-ices_data.rdata')


COST.val=csDataVal(COST)

# Correction les données
#COST.val@hh$rect <- "30F0"
#COST.val@hh$area  <- "27.1.a"

# Replace rectangle
rectold <- unique(COST.val@hh$rect)
rectnew <- convert.statsq.samplingarea(rectold)$parentarea
rectnew <-paste("FRSDMS",rectnew,sep="")
head(rectold)
head(rectnew)

# Define a stratification (par zone CIEM, trimestre, métier lvl5, et certains métier rassemblés en un seul OT._DEF)
strD <- strIni(spaceStrata="rect", timeStrata="month", techStrata="foCatEu5", spRec=list(from=rectold,to=rectnew))

COST.cons=csDataCons(COST.val,strD)

#landisVol(COST.val)
#lenDisPlot(COST.val,"Solea solea", "DIS", "all", "fo")

# Représenter les poids des captures par rectangle.
spacePlot(COST.cons, "lenNum", "rect", sum)
spacePlot(COST.val,"lenNum","rect",sum,rect.lines=T,maptype="values",cex.text=0.6,overlay=T)
?spacePlot
spacePlot(COST.val,"lenNum","rect",sum,plotmap=F)

lons <-COST.val@hh$lonIni
lats  <-COST.val@hh$latIni
trips <-as.numeric(factor(COST.val@hh$trpCode))
points(lons,lats,pch=16,cex=0.5,col=trips)


#spacePlot()
