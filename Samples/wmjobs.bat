set d=%~dp0
cd %d%

if exist dbt.bat del dbt.bat
if exist dbt.out del dbt.out
if exist dbt.mgf del dbt.mgf
if exist dbt.arc del dbt.arc
if exist dbt.pdb del dbt.pdb
if exist dbt.msv del dbt.msv
if exist dbt.asp del dbt.asp
if exist dbt.mol del dbt.mol
if exist dbt.gjf del dbt.gjf
if exist dbt.inp del dbt.inp

..\winmostar.exe dbt.dat -s -mopac1
..\winmostar.exe dbt.arc -s -o pdb
..\winmostar.exe dbt.arc -s -molsv 1 2.0 0.02
..\winmostar.exe dbt.arc -s -aspect
..\winmostar.exe dbt.pdb -s -hdel -o mol 
..\winmostar.exe dbt.mol -s -adjust -hadd -clean -o gjf 
..\winmostar.exe dbt.gjf -s -o inp

echo Exit in 10 seconds.
ping -n 10 localhost > nul
