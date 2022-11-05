@echo off

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%%a"

echo %ESC%[102m"* Create _host.txt file"%ESC%[0m
find "HOST: " example.apib > _host.txt

for /f "tokens=4 delims=:" %%a in ('type _host.txt^|find "HOST: "') do (
  set port=%%a
  goto :continue
)
:continue

set port=%port%

@REM echo %ESC%[101m"* Remove _host.txt file"%ESC%[0m
@REM del _host.txt

echo %ESC%[104m"* Runs drakov on port: "%ESC%[0m %ESC%[94m%port%%ESC%[0m
timeout 1 > nul

drakov -f example.apib -p %port%

@echo on