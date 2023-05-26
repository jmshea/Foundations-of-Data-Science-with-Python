
label define vlT5597600 1 "1: MALE"  2 "2: FEMALE" 
label values T5597600 vlT5597600

label define vlT5684500 -999999999 "-999999999 TO -6: < 0"  0 "0"  1 "1 TO 999"  1000 "1000 TO 1999"  2000 "2000 TO 2999"  3000 "3000 TO 3999"  4000 "4000 TO 4999"  5000 "5000 TO 5999"  6000 "6000 TO 6999"  7000 "7000 TO 7999"  8000 "8000 TO 8999"  9000 "9000 TO 9999"  10000 "10000 TO 14999"  15000 "15000 TO 19999"  20000 "20000 TO 24999"  25000 "25000 TO 49999"  50000 "50000 TO 99999999: 50000+" 
label values T5684500 vlT5684500

label define vlT9900000 0 "NONE"  93 "PRE-KINDERGARTEN"  94 "KINDERGARTEN"  1 "1ST GRADE"  2 "2ND GRADE"  3 "3RD GRADE"  4 "4TH GRADE"  5 "5TH GRADE"  6 "6TH GRADE"  7 "7TH GRADE"  8 "8TH GRADE"  9 "9TH GRADE"  10 "10TH GRADE"  11 "11TH GRADE"  12 "12TH GRADE"  13 "1ST YEAR COLLEGE"  14 "2ND YEAR COLLEGE"  15 "3RD YEAR COLLEGE"  16 "4TH YEAR COLLEGE"  17 "5TH YEAR COLLEGE"  18 "6TH YEAR COLLEGE"  19 "7TH YEAR COLLEGE"  20 "8TH YEAR COLLEGE OR MORE"  95 "UNGRADED" 
label values T9900000 vlT9900000
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */
  /* *start* */
/*
  rename R0000100 CASEID_1979 
  rename T5597600 Q11_GENHLTH_4B_2016   // Q11-GENHLTH_4B
  rename T5684500 TNFW_TRUNC_2016 
  rename T9900000 HGC_EVER_XRND 

*/
  /* *end* */  
/* To convert variable names to lower case use the TOLOWER command 
 *      (type findit tolower and follow the links to install).
 * TOLOWER VARLIST will change listed variables to lower case; 
 *  TOLOWER without a specified variable list will convert all variables in the dataset to lower case
 */
/* tolower */
