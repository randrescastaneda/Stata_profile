/*===========================================================================
project: profile
Author: Andres Castaneda 
---------------------------------------------------------------------------
Creation Date: September 2, 2014 
===========================================================================*/

/*==============================================================================
 0: Program set up 
==============================================================================*/

set matsize 2000
set more off, permanently 
set r on, permanently                         // display execution time
* set scheme plotplain, permanently
set scheme plotplainblind, permanently       // nice scheme for graphs avaialable in ssc
graph set window fontface "Times New Roman"  // font for graphs
set checksum off, permanently                // to clean api queries
set tracenumber on, permanently              // numbers on trace
set tracedepth 3  

* shortcuts
global F2 `"end;"'  // to work with pause
global F4 `"disp _dup(20) "-" "End of section" _dup(20) "-" _n(200) _dup(20) "-" "New section" _dup(20) "-";"' // clear results windows
global F5 `"cd "c:\Users\wb384996\OneDrive - WBG\temp\stata";"'   // cd 1
global F6 `"cd "x:\01.personal\wb384996\temporal\stata";"'        // cd 2 when working on network drive
global F9 `"BREAK;"'                                              // working with pause

global google_api ""    // store my api keys

* interaction with R
global Rterm_path    `"c:\Program Files\R\R-3.4.0\bin\x64\Rterm.exe"'
global Rterm_options `"--vanilla"'

* Open Important programs

* winexec "C:\Program Files\Microsoft Office 15\root\office15\OUTLOOK.EXE"  // start outlook
* sleep 5000

winexec "C:\Users\wb384996\Documents\Totalcmd\TOTALCMD64.EXE"   // start total commander
sleep 5000

winexec "C:\Program Files\Notepad++\notepad++.exe"     // start notepad ++
global MYEDITOR winexec notepad++

* winexec "c:\Users\wb384996\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Axosoft, LLC\GitKraken.lnk" // start GitKraken

* set cd depending on connectivity
cap cd "x:\01.personal\wb384996\temporal\stata"
if (_rc) {
	disp in g "you're not connect to the intranet." _n ///
		"Current directory set to:" _n                   ///
		in y "c:\Users\wb384996\OneDrive - WBG\temp\stata\"
	cd "c:\Users\wb384996\OneDrive - WBG\temp\stata\"
}

* set adopaths for working with Github and Git
local adodir1 "c:\Users\wb384996\OneDrive - WBG\GTSD\02.core_team\01.programs\01.ado"
local adodir2 "c:\Users\wb384996\OneDrive - WBG\ado\github_contr"
local adodir3 "c:\Users\wb384996\OneDrive - WBG\ado\myados"

local i = 1 
while ("`adodir`i''" != "") {
	local adodirs  `"`adodirs' "`adodir`i''" "' 
	local ++i
}

foreach adodir of local adodirs {
	
	local dirs: dir "`adodir'" dir "*"
	
	gettoken dir dirs : dirs
	while ("`dir'" != "")  {
		local files ""
		if regexm("`dir'", "^\.git|^_") {
			gettoken dir dirs : dirs
			continue
		}
		
		local ados: dir "`adodir'/`dir'" files "*.ado"
		local help: dir "`adodir'/`dir'" files "*.sthlp"
		local files = `"`ados'`help'"'
		
		if (`"`files'"' != "") {
			qui adopath ++ "`adodir'/`dir'"
			disp "`adodir'/`dir'"
		}
		
		local subdirs: dir "`adodir'/`dir'" dir "*"
		
		if (`"`subdirs'"' != "") {
			foreach subdir of local subdirs {
				if regexm("`subdir'", "^\.git|^_") continue
				local dirs "`dirs' `dir'/`subdir'"
			}		
		}
		gettoken dir dirs : dirs
	}
}



exit
/* End of do-file */
