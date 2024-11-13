@echo off

set "downloadfolder=%appdata%"
set "installer_file_name=install_scvpn_2_2_6"

set "url_sabre_dcp_installer_script=https://util.services.cvc.com.br/%installer_file_name%"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

powershell.exe -ExecutionPolicy Bypass -Command ^
  Invoke-WebRequest -Uri %url_sabre_dcp_installer_script% -OutFile ^"%downloadfolder%\%installer_file_name%.ps1^"; ^
  if (-Not (Test-Path ^"%downloadfolder%\%installer_file_name%.ps1^" )) { ^
    Write-Output 'Falha ao efetuar o download do script de instalacao. Verifique conexao ou contacte o suporte.'; ^
    exit; ^
  } else { ^
    Write-Output 'Download do script de instalacao efetuado com sucesso: ' ^"%downloadfolder%\%installer_file_name%.ps1^"; ^
  }; ^
  ^& ^"%downloadfolder%\%installer_file_name%.ps1^"

pause
