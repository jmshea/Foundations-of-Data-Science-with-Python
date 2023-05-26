options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'nls7.dat' lrecl=22 missover DSD DLM=' ' print;
input
  R0000100
  T5597600
  T5684500
  T9900000
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label R0000100 = "ID# (1-12686) 79";
  label T5597600 = "R GENDER 2016";
  label T5684500 = "FAMILY NET WEALTH (TRUNC) *KEY* 2016";
  label T9900000 = "HIGHEST GRADE EVER COMPLETED XRND";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  R0000100 = 'CASEID_1979'n
  T5597600 = 'Q11-GENHLTH_4B_2016'n
  T5684500 = 'TNFW_TRUNC_2016'n
  T9900000 = 'HGC_EVER_XRND'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx1f
  1='1: MALE'
  2='2: FEMALE'
;
value vx2f
  -999999999--6='-999999999 TO -6: < 0'
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx3f
  0='NONE'
  93='PRE-KINDERGARTEN'
  94='KINDERGARTEN'
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format T5597600 vx1f.;
  format T5684500 vx2f.;
  format T9900000 vx3f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'Q11-GENHLTH_4B_2016'n vx1f.;
  format 'TNFW_TRUNC_2016'n vx2f.;
  format 'HGC_EVER_XRND'n vx3f.;
run;
*/