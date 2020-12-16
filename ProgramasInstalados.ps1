# Array de programas o software que no debe incluirse
# $noContarSoftware=@("")

$NombreEquipo= HOSTNAME
$DireccionIP= ipconfig | Select-String -Pattern "IPv4" | Select-String -Pattern "192.168.2" |% {($_ -replace "`r","") -replace "`n",""}
$DireccionIP=$DireccionIP.Substring($DireccionIP.IndexOf(":")+1, $DireccionIP.Length - $DireccionIP.IndexOf(":")-1)
$fecha= date |% {($_ -replace "`r","") -replace "`n",""}
#$rutaArchivoDeResultado="C:\Users\hmejia\Desktop\SoftwareInstalado\$DireccionIP.txt"
$rutaArchivoDeResultado="C:\Users\hmejia\Desktop\SoftwareInstalado\$DireccionIP.txt"
echo "==============================================================================================================================" #>> $rutaArchivoDeResultado
echo "Nombre de equipo: "$NombreEquipo #>> $rutaArchivoDeResultado
echo  "Dirrecion de red: " $DireccionIP #>> $rutaArchivoDeResultado
echo "Ejecutado en fecha: "$fecha #>> $rutaArchivoDeResultado
echo "==============================================================================================================================" #>> $rutaArchivoDeResultado
$contenido1=Get-WmiObject -Class Win32_Product | Select-Object -Property name, version,Description #>> $rutaArchivoDeResultado
$contenido2=Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName,DisplayVersion | Format-Table –AutoSize #>> $rutaArchivoDeResultado
$contenido3=ls 'C:\Program Files'
$contenido4=ls 'C:\Program Files (x86)'

$contenido1 
$contenido2
$contenido3
$contenido4

$fechaculminacion=date
echo "Fecha y hora que termino el script: " $fechaculminacion
echo "------------------------------------------------------------------------------------------------------------------------------" #>> $rutaArchivoDeResultado






#powershell.exe -ExecutionPolicy Bypass -File C:\Users\hmejia\Desktop\ProgramasInstalados.ps1

