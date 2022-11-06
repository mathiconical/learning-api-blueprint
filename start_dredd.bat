@echo off

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%%a"

echo %ESC%[102m"* Create _host.txt file"%ESC%[0m
find "HOST: " example.apib > _host.txt

for /f "tokens=2 delims=:" %%a in ('type _host.txt^|find "HOST: "') do (
  set http=%%a
  goto :get_http
)
:get_http

set http=%http%

for /f "tokens=3 delims=:" %%a in ('type _host.txt^|find "HOST: "') do (
  set address=%%a
  goto :get_address
)
:get_address

if %address% == //127.0.0.1 (
  set address=//localhost
)

set address=%address%

for /f "tokens=4 delims=:" %%a in ('type _host.txt^|find "HOST: "') do (
  set port=%%a
  goto :get_port
)
:get_port

set port=%port%

set address_port=%http%:%address%:%port%

@REM echo %ESC%[101m"* Remove _host.txt file"%ESC%[0m
@REM del _host.txt

echo %ESC%[102m"* Runs dredd on port:  "%ESC%[0m %ESC%[94m%port%%ESC%[0m
timeout 2 > nul
cmd /k dredd example.apib%address_port%
exit
@echo on