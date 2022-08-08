
********************************************************************************
*
* Setting up a Do-File Header
*
********************************************************************************
version 17.0 // tells Stata on which version it should interpret commands on
clear // removes data and value labels
set scrollbufsize 500000 // determines how far back you can scroll in the result window
********************************************************************************
cd "/Users/msassrg6/Documents/My Docs/Data/Comparative/CSES 5/cses5.dta" // change working directory
cd "/Users/msassrg6/Documents/My Docs/Articles/QDS/US YouGov DataSet 190722"
pwd // print current working directory
use "cses5.dta" //opens file
use "US YouGov DataSet 190722"
browse 
describe
summarize
codebook
help language

* Example for WINDOWS: cd "C:/Users/jungmans/Nextcloud/Stata_Summer_School/"
dir // show all files included in the directory
* relative file paths make collaboration easier:
cd .. // navigate to parent folder
dir
cd ./Data // navigate back to sub-folder "data"

2.2 Explore specific variables
------------------------------
***/
/* lookfor male and gender */
lookfor "gender"
generate gender = 0
lookfor "gender"
lookfor "male"
tab E2002
/* list E1005 E2002 in 1/10 */ look at variables for first 10 observations 
list E1005 E2002 in 1/10
/* browse, describe, summarize and codebook with varlist */
browse E1004 E1005 E1008 E2002 E2003 E2004 
describe E1004 E1005 E1008 E2002 E2003 E2004 
summarize E1004 E1005 E1008 E2002 E2003 E2004 
codebook E1004 E1005 E1008 E2002 E2003 E2004 


/***
2.3 All-Time Fave: tabulate
------------------------------
***/
tabulate E2002
tabulate E2002, nolabel
tabulate E2001_Y
tabulate E2001_Y, missing
tabulate E2002 E2006
/* option ", nolabel" display numeric codes instead of value labels */
replace E2001_Y = . if E2001_Y == 9999 // simply execute this line, which is needed for the next example
/* problem tabulate missing values (E2001_Y)*/
codebook E2001_Y // 585 cases have a missing data point 
tabulate E2001_Y // missing values not displayed
tabulate E2001_Y, missing // treat missing values like other values
/* problem: tabulate and too many values */
tabulate E1005
/* problem not so many variables to specify */
tabulate E2002 E2006 // two-way table
tabulate E2002 E2006 E1005 // does not work: too many variables specified

/***
2.4 User-written Stata ados
------------------------------
***/
fre E2002 // does not work if ado-file is not installed
help fre // does not lead to help site because it is not installed yet
ssc describe fre // package description if the ado-file is archived at SSC 
ssc install fre // installs package i not existing
fre E2002 // one-way frequency table of E2002
fre E2002 E2006 // one-way frequency tables of E2002 and E2006

/***
2.5 sort and bysort
------------------------------
***/
/* sort dataset by E1005 and E2002 */
list E1005 E2002 in 1/10 // The loaded dataset is sorted by E1005
sort E2002 // sort dataset based on values of E2002
list E1005 E2002 in 1/10 // ... it is now sorted by E2002
sort E1005 // arrange back to E1005
list E1005 E2002 in 1/10
/* bysort  */
bysort E2002: tabulate E2006 // summary statistics of E2006 by gender 
list E1005 E2002 in 1/10 // as a result the order of observations is changed 
sort E1005























********************************************************************************
* Import data from working directory:

use "cses5.dta", clear // open dataset and clear memory

import spss "cses5.sav", clear // import spss files

import delimited "cses5.csv", clear // import csv files

help import // open help file for "import" command



* import delimited "cses5.csv", clear case(preserve) 




























********************************************************************************
* Alternatively, download data directly from the web into specified directory: 

dir

copy "https://cses.org/wp-content/uploads/2022/02/cses5_r.zip" ///
      cses5.zip, replace

dir
	  
unzipfile cses5.zip, replace // unzip file into working directory
 
erase cses5.zip // delete zipfile from working directory 

erase cses5.rdata // delete R File from working directory 



*** END OF FILE ***
