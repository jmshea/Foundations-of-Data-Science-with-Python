file handle pcdat/name='nls7.dat' /lrecl=22.
data list file pcdat free /
  R0000100 (F5)
  T5597600 (F2)
  T5684500 (F7)
  T9900000 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  R0000100  "ID# (1-12686) 79"
  T5597600  "R GENDER 2016"
  T5684500  "FAMILY NET WEALTH (TRUNC) *KEY* 2016"
  T9900000  "HIGHEST GRADE EVER COMPLETED XRND"
.

* Recode continuous values. 
* recode 
    / 
 T5684500 
    (-999999999 thru -6 eq -999999999)
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
.

* value labels
 T5597600
    1 "1: MALE"
    2 "2: FEMALE"
    /
 T5684500
    -999999999 "-999999999 TO -6: < 0"
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T9900000
    0 "NONE"
    93 "PRE-KINDERGARTEN"
    94 "KINDERGARTEN"
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (R0000100 = CASEID_1979) 
  (T5597600 = Q11_GENHLTH_4B_2016)   /* Q11-GENHLTH_4B */
  (T5684500 = TNFW_TRUNC_2016) 
  (T9900000 = HGC_EVER_XRND) 
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=R0000100, 
  T5597600, 
  T5684500, 
  T9900000.

*--- Tabulations using qname variables.
*freq var=CASEID_1979, 
  Q11_GENHLTH_4B_2016, 
  TNFW_TRUNC_2016, 
  HGC_EVER_XRND.
