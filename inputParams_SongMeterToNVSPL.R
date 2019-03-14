## GENERATES A PARAMETERS INPUT FILE FOR SongMeterToNVSPL_modPAMGUIDE.R
# created on 2/1/2019

rm(list=ls(all=TRUE)) 

#--------------------------------------------------------------------------------
# INSTALL PACKAGES
#--------------------------------------------------------------------------------
library(svDialogs)


## UPDATE THE FOLLOWING PARAMETERS before running SongMeterToNVSPL scripts
#--------------------------------------------------------------------------------

## (1) SET DIRECTORY WHERE ALL AUDIO FILES TO PROCESS ARE
#if you want to process multiple directories (site) with same recording parameters, choose the highest directory
WAVDirsDIR =  "F:\\NPS_DATA\\BioacousticPhenology\\GLBA\\AUDIO\\2018"

## (2) LIST OF DIRECTORIES TO PROCESS
WAVDirs = list.dirs(WAVDirsDIR)
# ARE YOUR FILES IN "Data" subdirectories? (standard format from song meters)
DataFolders = "No" # "Yes"
if (DataFolders == "Yes") {WAVDirs = WAVDirs[grep("Data", WAVDirs)]}

## (3) FILE NAMES FORMAT
filext = "_%Y%m%d_%H%M%S.wav"
filpat = ".+\\d{8}_\\d{6}.wav"
# list.files(WAVDirs[1], pattern = filpat, full.names = TRUE) 

## (4) VERSION OF PAMGUIDE, see the most recent code
vers = "PAMGUIDE_V9"

## (5) SET DIRECTORY WITH PAMGUIDE CODE
PAMdir = "F:\\CODE\\GitHub\\SongMeterToNVSPL\\"

## (6) SET CALIBRATION PARAMS FOR THE INSTRUMENT
instrum = "SM4"
project = "GLBA2018" #give your files a project name
mhset   = -35    #microphone sensitivity dBV/Pa
Gset    = 16     #gain setting
vADCset = 1      #zero-peak
enviset = "Air"  #"Air" or "Wat" 
envir   = 2      #1= water, 2=air measurements
rescWat = 0      #1= if you want to re-scale underwater values to be able to plot using AMT?
timezone = "GMT" #what time zone are the times in? so you can convert later if necessary

# SM2: mh=-36, G=xx, vADC=1.414
# SM3: mh=-36, G=XX, vADC=1
# SM4: mh=-35, G=XX, vADC=1

#--------------------------------------------------------------------------------
## WRITE OUT THE FILE- do not change!
#--------------------------------------------------------------------------------
setwd(WAVDirsDIR)
save.image(file=paste("paramsFile_",project,"_",instrum,sep=""))
