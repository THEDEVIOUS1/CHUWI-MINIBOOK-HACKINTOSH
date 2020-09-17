@ echo -off
echo -off

set AfuName  AfuEfix64.efi
set BIOSName BIOS.bin

set BlkNum 0
if exist fs%BlkNum%:\%AfuName% then
fs%BlkNum%:\%AfuName%  fs%BlkNum%:\%BIOSName% /p /b /n /r /reboot /meul
goto success
endif

for %a RUN (1 16)
set BlkNum %a
if exist fs%BlkNum%:\%AfuName%  then
fs%BlkNum%:\%AfuName%  fs%BlkNum%:\%BIOSName% /p /b /n /r /reboot /meul
goto success
endif
endfor

set -d BlkNum
set -d BIOSName 
set -d AfuName 
goto end  
:success 

:end