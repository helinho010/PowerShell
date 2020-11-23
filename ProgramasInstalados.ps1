
$NombreEquipo= HOSTNAME
$DireccionIP= ipconfig | Select-String -Pattern "IPv4" | Select-String -Pattern "192.168.2" |% {($_ -replace "`r","") -replace "`n",""}
$DireccionIP=$DireccionIP.Substring($DireccionIP.IndexOf(":")+1, $DireccionIP.Length - $DireccionIP.IndexOf(":")-1)
$fecha= date |% {($_ -replace "`r","") -replace "`n",""}
#$rutaArchivoDeResultado="C:\Users\hmejia\Desktop\SoftwareInstalado\$DireccionIP.txt"
$rutaArchivoDeResultado="C:\Users\hmejia\Desktop\SoftwareInstalado\$DireccionIP.txt"
echo "==============================================================================================================================" >> $rutaArchivoDeResultado
echo "Nombre de equipo: "$NombreEquipo >> $rutaArchivoDeResultado
echo  "Dirrecion de red: " $DireccionIP >> $rutaArchivoDeResultado
echo "Ejecutado en fecha: "$fecha >> $rutaArchivoDeResultado
echo "==============================================================================================================================" >> $rutaArchivoDeResultado
Get-WmiObject -Class Win32_Product | Select-Object -Property name, version,Description >> $rutaArchivoDeResultado
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName,DisplayVersion | Format-Table –AutoSize >> $rutaArchivoDeResultado

echo "------------------------------------------------------------------------------------------------------------------------------" >> $rutaArchivoDeResultado


#powershell.exe -ExecutionPolicy Bypass -File C:\Users\hmejia\Desktop\ProgramasInstalados.ps1