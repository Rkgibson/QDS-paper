version 17.0 // tells stata on which version it should interpret commands on

clear // removes data and value labels from memory

set scrollbufsize 500000 // determines how far back you can scroll in the Results window
use "C:\Users\msassrg6\Documents\My Docs\Professional\Methods Training Courses\GESIS Stata course\QDS Paper 080822.dta", clear

browse
ssc describe fre
ssc install fre 
fre uom_uspre_1x_1-uom_uspre_1x_10
summarize uom_uspre_1x_1-uom_uspre_1x_10 
codebook
help language
recode uom_uspre_1x_6 (7 = 1)(6 = 2)(5 = 3)(4 = 4)(3 = 5) (2 = 6) (1= 7), gen(upre_1x_6r)
recode uom_uspre_1x_2 (7 = 1)(6 = 2)(5 = 3)(4 = 4)(3 = 5) (2 = 6) (1= 7), gen(upre_1x_2r)
recode uom_uspre_1x_8 (7 = 1)(6 = 2)(5 = 3)(4 = 4)(3 = 5) (2 = 6) (1= 7), gen(upre_1x_8r)
recode uom_uspre_1x_4 (7 = 1)(6 = 2)(5 = 3)(4 = 4)(3 = 5) (2 = 6) (1= 7), gen(upre_1x_4r)
recode uom_uspre_1x_10 (7 = 1)(6 = 2)(5 = 3)(4 = 4)(3 = 5) (2 = 6) (1= 7), gen(upre_1x_10r)
fre uom_uspre_1x_6 upre_1x_6r
fre uom_uspre_1x_2 upre_1x_2r
fre uom_uspre_1x_6 upre_1x_6r
fre uom_uspre_1x_8 upre_1x_8r
fre uom_uspre_1x_10 upre_1x_10r
generate extrav = (uom_uspre_1x_1 + upre_1x_6r)/2
generate agree = (uom_uspre_1x_7 + upre_1x_2r)/2
generate consc = (uom_uspre_1x_3 + upre_1x_8r)/2
generate emostab = (uom_uspre_1x_9 + upre_1x_4r)/2
generate open = (uom_uspre_1x_5 + upre_1x_10r)/2
frequencies extrav agree consc emostab open
tab extrav agree consc emostab open
summarize extrav agree consc emostab open
tabulate race race4 empl3 pid7 pid_direction
fre race race4 empl3 pid7 pid_direction
fre MediumHighPersonalisationSum FScale_USDDC2 FScale_USDDC4
lookup attention
regress ProcessKnowScale age i.gender educ profile_gross_household i.race4 i.ideo7 i.empl3 i.pid7 uom_uspre_6d_1 uom_uspre_6f_1 uom_uspre_5_1 uom_usddc_24_pre extrav agree consc emostab open
regress MediumHighPersonalisationSum age i.gender educ profile_gross_household i.race4 i.ideo7 i.empl3 i.pid7 uom_uspre_6d_1 uom_uspre_6f_1 uom_uspre_5_1 uom_usddc_24_pre extrav agree consc emostab open
regress FScale_USDDC4 age i.gender educ profile_gross_household i.race4 i.ideo7 i.empl3 i.pid7 uom_uspre_6d_1 uom_uspre_6f_1 uom_uspre_5_1 uom_usddc_24_pre extrav agree consc emostab open
regress FScale_USDDC2 age i.gender educ profile_gross_household i.race4 i.ideo7 i.empl3 i.pid7 uom_uspre_6d_1 uom_uspre_6f_1 uom_uspre_5_1 uom_usddc_24_pre extrav agree consc emostab open