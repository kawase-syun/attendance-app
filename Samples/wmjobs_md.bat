set d=%~dp0
cd %d%

if exist ch4_am1bcc.mol2       del ch4_am1bcc.mol2
if exist ch4_resp.mol2         del ch4_resp.mol2
if exist ch4_100_etoh_2.mol2   del ch4_100_etoh_2.mol2
if exist thf_balloon_resp.mol2 del thf_balloon_resp.mol2
if exist thf_babel_resp.mol2   del thf_babel_resp.mol2
if exist ch4_gaff.gro  del ch4_gaff.gro
if exist ch4_gaff.top  del ch4_gaff.top
if exist ch4_gaff.data del ch4_gaff.data

rem NOTE: Resulting files will be generated under UserData\.
rem       It is recommended to specify absolute path.

..\winmostar.exe ch4_resp.dat  -s -clean -am1bcc 0 -outfile ..\Samples\ch4_am1bcc.mol2
..\winmostar.exe ch4_resp.dat  -s -clean -resp   0 -outfile ..\Samples\ch4_resp.mol2
..\winmostar.exe ch4_resp.mol2 -s -pack ch4_resp.mol2:100:ethanol_am1.mol2:2 0.6 -outfile ..\Samples\ch4_100_etoh_2.mol2
..\winmostar.exe C1CCOC1 -s -smilesballoon -clean -resp 0 -outfile ..\Samples\thf_balloon_resp.mol2
..\winmostar.exe C1CCOC1 -s -smilesbabel   -clean -resp 0 -outfile ..\Samples\thf_babel_resp.mol2
..\winmostar.exe ch4.mol2    -s -gromacsfile GAFF SPC/E ..\Samples\ch4_gaff.gro ..\Samples\ch4_gaff.top
..\winmostar.exe ch4.mol2    -s -lammpsfile  GAFF SPC/E ..\Samples\ch4_gaff.data
..\winmostar.exe ch4_100_etoh_2.mol2 -s -lammps "Dreiding" "Minimize (fast):NVT (fast):NPT (fast)" 2

echo Exit in 10 seconds.
ping -n 10 localhost > nul
