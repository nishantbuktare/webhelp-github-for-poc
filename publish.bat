@echo off
REM Copy the LICENSE_KEY variable into 'licensekey.txt' in Oxygen Publishing Engine 
echo Copying license key...
echo %LICENSE_KEY% > ope\licensekey.txt

REM The LICENSE_KEY variable does not contain a new line character but '@@' instead
REM Replace all the '@@' characters back to '\n' in the 'licensekey.txt' file
echo Fixing line endings in licensekey.txt...
powershell -command "(Get-Content 'ope\licensekey.txt' -Raw) -replace '@@', [System.Environment]::NewLine | Set-Content 'ope\licensekey.txt'"

REM Run the PDF CSS HTML5 transformation
echo Running PDF CSS HTML5 transformation...
ope\bin\dita.bat -f pdf-css-html5 -i sample\space.ditamap -o sample\out\pdf-css-html5 -Dpdf.publishing.template=publishing -Dpdf.publishing.template.descriptor=basket.opt

REM Run the WebHelp Responsive transformation
echo Running WebHelp Responsive transformation...
ope\bin\dita.bat -f webhelp-responsive -i sample\space.ditamap -o sample\out\webhelp-responsive -Dwebhelp.publishing.template=publishing -Dwebhelp.publishing.template.descriptor=basket.opt

echo Publishing process completed.
