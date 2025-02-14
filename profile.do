/*===========================================================================
project: profile
Author: Andres Castaneda 
---------------------------------------------------------------------------
Creation Date: September 2, 2014 
===========================================================================*/

/*==============================================================================
 0: Program set up 
==============================================================================*/
* 
set matsize 2000
set more off, permanently 
set r on, permanently
set scheme plotplain, permanently
set scheme plotplainblind, permanently
graph set window fontface "Times New Roman"
set checksum off, permanently
set tracenumber on, permanently
set tracedepth 3

* set trace on 

* defining quick keys ie.

* global rootdatalib "S:\Datalib2"
* global rootdatalib "S:\Datalib"

* Changing Datalib source.
  

global F2 `"end;"'
global F4 `"disp _dup(20) "-" "End of section" _dup(20) "-" _n(200) _dup(20) "-" "New section" _dup(20) "-";"'
global F5 `"cd "c:\Users\wb384996\OneDrive - WBG\temp\stata";"'
global F6 `"cd "p:/02.personal\wb384996\temporal\stata";"' 
global F9 `"BREAK;"'
global F8 `"frame change default;"'

global google_api "AIzaSyAoZxkrCxvpdhdukbaSPB27ljitNCl7j3Y"

global Rterm_path    `"c:\Program Files\R\R-3.4.0\bin\x64\Rterm.exe"'
global Rterm_options `"--vanilla"'


* Open Important programs

* winexec "C:\Program Files\Microsoft Office 15\root\office15\OUTLOOK.EXE"
* sleep 5000

* winexec "C:\Users\wb384996\Documents\Totalcmd\TOTALCMD64.EXE"
winexec "C:\Program Files (x86)\Totalcmd\TOTALCMD64.EXE"
sleep 5000

winexec "C:\Program Files\Notepad++\notepad++.exe"
*winexec "C:\Program Files\Sublime Text 3\sublime_text.exe"
sleep 3000

*winexec "C:\Program Files\Sublime Merge\sublime_merge.exe"
global MYEDITOR winexec notepad++

global mf_am19 = 20191119221122

// ******** povcalnet 
global pcn_svr_ar = "http://wbgmsrech001/PovcalNet-AR/api"
global pcn_svr_ts = "http://wbgmsrech001/PovcalNet-testing"
global pcn_svr_in = "http://wbgmsrech001/PovcalNet"


// ******** pip
global pip_svr_qa = "https://apiv2qa.worldbank.org" // QA
global pip_svr_ts = "" // testing
global pip_svr_ar = "" 
global pip_svr_pr = "https://api.worldbank.org" // Production



* winexec "c:\Users\wb384996\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Axosoft, LLC\GitKraken.lnk"

/* 
cap cd "p:/02.personal\wb384996\temporal\stata"
if (_rc) {
	disp in g "you're not connect to the intranet." _n ///
		"Current directory set to:" _n                   ///
		in y "c:\Users\wb384996\OneDrive - WBG\temp\stata\"
	cd "c:\Users\wb384996\OneDrive - WBG\temp\stata\"
}
 */

qui adodir ++

*/

exit

><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

/*
if date("`c(current_date)'", "DMY") < date("30 Mar 2017", "DMY") {
	 run "Z:\public\LAC\MPO\MPO spring 2017 LAC\_do-files\MPO_LAC_charts.do" 
}
 */

/* Back up

* Add option to -backup- in which user can select whether to make a perfect mirror or
	save folder by dates. Also, it would be nice to add all the options of ROBOCOPY

backup, source("C:\ado") destination("E:\destination") ///
 xdir(`" "C:\source\exclude" "C:\source\to exclude" "') ///
 speed(100) nfolders(6) period(2w) mirror
 */

* ado files
* shell ROBOCOPY "C:\ado" "C:\Users\wb384996\Box Sync\ado" /e /XO /XX /MT:100

* MEXICO CEQ
* shell ROBOCOPY "Z:\Mexico HOI" "C:\Users\wb384996\Box Sync\Mexico CEQ" /e /XO /XX /MT:100


/* End of do-file */

/*
 /XO : eXclude Older - if destination file exists and is the same date
 or newer than the source - don’t bother to overwrite it.
/XC | /XN : eXclude Changed | Newer files
 /XL : eXclude "Lonely" files and dirs (present in source but not destination)
 This will prevent any new files being added to the destination.
 /XX : eXclude "eXtra" files and dirs (present in destination but not source)
 This will prevent any deletions from the destination. (this is the default)
			
 /XF file [file]... : eXclude Files matching given names/paths/wildcards.
/XD dirs [dirs]... : eXclude Directories matching given names/paths.
                     XF and XD can be used in combination  e.g.
                     ROBOCOPY c:\source d:\dest /XF *.doc *.xls /XD c:\unwanted /S 
 
 
 
 
  net inst brewscheme, from("https://wbuchanan.github.io/brewscheme/") replace
	brewcolordb, replace
 
*/

* global F8 `"global rootdatalib "\\lcrms02\DatalibPub\Datalib";"'

http://www.asciitable.com/


additional schemes 
plotplain - plotplainblind - plottig - plottigblind

net install brewscheme, from("http://wbuchanan.github.io/brewscheme") replace

set scheme burd, perm

