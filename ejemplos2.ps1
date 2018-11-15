<#
Ejemplos de PowerShell
autor: yo
fecha: 6-abril-2013
#>

#37 emular el comando top de Linux
while (1) { ps | sort -desc cpu | select -first 30; sleep -seconds 2; cls }


#36 uso de for
clear
$ints = @('fer','camila','dan')
for ($i=0; $i -le $ints.Length – 1; $i++)
{Write-Host $ints[$i]}



#35 paso de parametros
$args
"no. de parametros: $($args.count)"

# 34 horoscopo chino
clear
$datos = @{0="mono";1="gallo";2="perro";3="cerdo";4="rata";5="buey";6="tigre";7="conejo";8="dragon";9="serpiente";10="caballo";11="cabra"}
$datos | Sort-Object
$anyo=Read-Host "Introduce año: "
$resto=$anyo%12
Write-Host "Te corresponde el signo de: "$datos.get_Item($resto)



#33 cuenta vocales
Clear-Host
$cadena=Read-Host "Introduce cadena"
Write-Host "introduciste " $cadena
$cont=0
$aux=""
for($i=0;$i -le $cadena.Length;$i++){
 $c=$cadena[$i]
  if($c -eq "a" -or $c -eq "e" -or $c -eq "i" -or $c -eq "o" -or $c -eq "u"){
   $cont++
   $aux+=","+$c
 }
}
Write-Host "no. de vocales: "$cont"  ,vocales obtenidas: "$aux


#32 uso de expresiones regulares
Clear-Host
"Fernando" -match "F.er"
"Ariel" -match ".riel"
"En un campo alegre" -match "E?a"
"mi gata" -match "m.g"
"mia" -match "m+a"
"mia" -match "m?a"
"mia" -match "m\.a"
"Fer" -match "\w*"
"Fer" -match "\w"
$correo="gatibal.gato@latinmail.com"
$correo.Replace("latinmail","gmail")
"gatibal.gato@gmail.com".Replace("@gmail.com","@yahoo.com.mx")
$cadena="Mi gato come mucho"
Write-Host "tamaño: " $cadena.Length
Write-Host "ahora: " $cadena.Remove(3)


#31 enviar correo
$filename = “c:\scripts_scott\test9999.xls”
$smtpserver = “smtp.gmail.com”
$msg = new-object Net.Mail.MailMessage
$att = new-object Net.Mail.Attachment($filename)
$smtp = new-object Net.Mail.SmtpClient($smtpServer )
$smtp.EnableSsl = $True
$smtp.Credentials = New-Object System.Net.NetworkCredential(“username”, “password_here”); # Put username without the @GMAIL.com or – @gmail.com
$msg.From = “username@gmail.com”
$msg.To.Add(”boss@job.com”)
$msg.Subject = “Monthly Report”
$msg.Body = “Good Morning, Last month’s LOGINS & GROUPCALLS FOR ALL GIDS IN SYSTEM IS ATTACHED”
$msg.Attachments.Add($att)
$smtp.Send($msg)

#30 calcular valor futuro
clear-host
"----------------------------------"
"             Menú                 "
"----------------------------------"
$valor=read-host "Valor: "
$tasa=read-host "Tasa:"
$periodo=read-host "Periodo:"
$resultado=0
#mostrar valores
write-host "valor : $valor"
write-host "tasa : $tasa"
write-host "periodo : $periodo"
""
""
"[Resultado]"
foreach ($n in 1..$periodo) {
$resultado=[math]::pow(1+$tasa/100,$n) 
$resultado=$resultado*$valor
write-host "$resultado  periodo --> $n"

}


#29 introducir datos
$nombre = Read-Host "Tu nombre: "
$password = Read-Host -assecurestring "Tu clave: "
#mostrar
write-host "Hola $nombre"
Clear-Host
$YearCalc = Read-Host "¿cuando naciste?"
$Now = (Get-Date -uformat "%Y") -$YearCalc
$Maybe = $Now -1
Write-Host "tu tienes  $Maybe o $Now años"

#28 ejemplo de función con parámetros
$g=9.81

Function altura{
 param($t)
 if($t -eq 0){
   return 0
 }else{
   return ($g*[System.Math]::Pow($t,2))/2
 }
}
$result=altura(6.309)

write-host "$result"


#27 bucle foreach
$lista=200,250,300,350,400
write-host "lista [$lista]"
foreach($l in $lista){
     if($l -eq 250){
       "$l, valor encontrado"
     }else{
        $result=$l*2; 
       write-host "$l   $l*2: $result"
     }
}


#26 menú básico
clear-host
write-host "#############################"
write-host ""
write-host "            Menu             "
write-host ""
write-host "1. Ver version"
write-host "2. Ver fecha"
write-host "3. Ver ayuda"
write-host "4. Abrir bloc de notas"
write-host "5. Abrir calculadora"
write-host "6. Salir"
write-host "#############################"
$opc = Read-Host "Tu opcion: "
write-host ""
write-host "introduciste [$opc]"
#if(opc != 0 || opc >= 6)
if($opc -ne 0  -or $opc -ge 6){

switch($opc){
  1 {write-host "version" -ForegroundColor Cyan
     get-host
  }
  2 {write-host "fecha" -ForegroundColor Cyan
     get-date
     
  }
  3 {write-host "ayuda" -ForegroundColor Cyan
     get-help
  }
  4 {write-host "bloc de notas" -ForegroundColor Cyan
      abreBloc
  }
  5 {write-host "calculadora" -ForegroundColor Cyan
      abreCalc
  }
  6 {write-host "fin" -ForegroundColor Red
      exit
  }

}#fin switch

}

# Microsoft PowerShell script to create a simple function 
# Author: Guy Thomas 
# Version 2.1 May 2008 tested on PowerShell v 1.0

#function BatAvg

#{param ($Name, $Runs, $Outs)

#$Avg = [int]($Runs / $Outs*100)/100

#Write-Output "$Name's Average = $Avg, $Runs, $Outs "
#}


Function abreBloc{
  start notepad
}

Function abreCalc{
  start calc
}


#25
clear
"#############################################
#                 Powershell                #
#############################################"
get-host
$cadena="pelo"
$archivo="C:\Users\fernando\Documents\Ejemplos\servicio.txt"
$fecha=(get-date)
$fecha
$nombre = Read-Host "Tu nombre es: "
$password = Read-Host -assecurestring "Tu password: "
write-host "Bienvenido $nombre"
"Te encuentras en:"
gl
"usuario:"
whoami
$cad=$cadena-replace("l","rr")
$cad
"contenido del archivo:"
get-content $archivo
$compara=whoami
if($nombre -eq $compara){"iguales"}else{"no iguales"}



function abre{
  param($nombre)
   if($nombre -eq "fernando"){"start notepad"}else{"start calc, nada igual"}
}


#invocar a la función
abre($nombre)

$numero= read-host "número: "
switch($numero){
   1 {" abre"}
   2 {" cierra"}
   3 {" apaga"}
   default {"inactivo"}
}

try{
 "abriendo archivo, se ejecuto esto"
  abre($nombre)
}catch{
 "no se encuentra  el archivo"
}

$cont=0
$maximo=10
while($cont -le $maximo){
 write-host "$cont"
 $cont+=1
}

$b=90
$a=700


$persistent = "False"
[System.Convert]::ToBoolean($persistent)


function comparar($b){
 if($b -eq $a){
   "real"
 }else{
  " no existe"
 }

}

comparar($b)
$persistent.gettype()

#Get-Process | ForEach-Object {Write-Host $_.name -foregroundcolor cyan}
#write-host "Algo"
#############################################
#$a = (get-date).day
#$a = (get-date).dayofweek
#$a = (get-date).dayofyear
#$a = (get-date).hour
#$a = (get-date).millisecond
#$a = (get-date).minute
#$a = (get-date).month
#$a = (get-date).second
#$a = (get-date).timeofday
#$a = (get-date).year
#get-date -DisplayHint date
#$now=Get-Date -format "dd-MMM-yyyy HH:mm"
#get-date -format g
#(get-date).dayofyear
#$a = get-wmiobject win32_bios -computer SERVER64
#$a | format-list -property Name, @{Label="BIOS Date "; `
#Expression={$_.ConvertToDateTime($_.ReleaseDate)}}
#######################################################
#dir <enter>
#ls <enter>
#gci <enter>
Get-ChildItem <enter>
#asignar un alias
Set-Alias gs Get-Service <enter>
#exportar contenido a un txt
Export-Alias -Path Aliases.txt <enter>



#24
clear
Get-Content C:\servicio.txt

$a = Get-Content C:\Users\fernando\Documents\Ejemplos\servicio.txt
write-host "$a"

(Get-Content C:\Users\fernando\Documents\Ejemplos\servicio.txt)[0 .. 2]

$arch=get-content C:\Users\fernando\Documents\Ejemplos\servicio.txt
ForEach-Object {Write-Host $arch -foregroundcolor red}

foreach ($number in 1..10 ) { $number * 4}


# PowerShell foreach loop to display files in C:\Program files
$Path = "C:\Program Files\"
"{0,10} {1,-24} {2,-2}" -f `
" Size", "Last Accessed", "File Name "
Foreach ($file in Get-Childitem $Path -recurse -force)
{If ($file.extension -eq ".txt")
    {
    "{0,10} {1,-24} {2,-2}" -f `
    $file.length, $file.LastAccessTime, $file.fullname
    }
}


##############################################

# PowerShell foreach loop piping into block statement
Clear-Host
$Path = "C:\Program Files\"
Get-Childitem $Path -recurse -force | Foreach {
If ($_.extension -eq ".txt") {
Write-Host $_.fullname 
     }
}



$strResponse = “Quit”
do {$strResponse = Read-Host “Are you sure you want to quit application? (Y/N)”}
until ($strResponse -eq “Y”)

New-Item -ItemType file freespace.txt

$date = ( get-date ).ToString('yyyyMMdd')                                                                                             
$file = New-Item -type file "$date-freespace.txt"                                                                                     
$date = ( get-date ).ToString('yyyyMMdd')   

ForEach ($system in Get-Content "servicio.txt")
{Write-Host $system}                                                                                      
                                                                                            


#23 función sencilla
function mensaje{
   "hola"
}
mensaje

#22
$num1=9
$num2=4
"Valores booleanos"
$res=$num1 -gt $num2 
Write-Host "$num1 -gt $num2  "$res
$res=$num1 -lt $num2 
Write-Host "$num1 -lt $num2  "$res
$res=$num1 -eq $num2 
Write-Host "$num1 -eq $num2  "$res
$res=$num1 -ne $num2 
Write-Host "$num1 -ne $num2  "$res
$res=$num1 -le $num2 
Write-Host "$num1 -le $num2  "$res
$res=$num1 -ge $num2 
Write-Host "$num1 -ge $num2  "$res

#21 estructuras de control
Write-Host "uso de do{}while(cond)"
$i = 1
do {
Write-Host $i
$i++
}
while ($i -le 5)

Write-Host "uso de while(cond){}"
$i = 1
while ($i -le 5) {
Write-Host $i
$i++
}

Write-Host "uso de do{}until(cond)"
$i = 1
do {Write-Host $i; $i++}
until ($i -gt 5)

$strResponse = “Quit”
do {$strResponse = Read-Host “Are you sure you want to quit application? (Y/N)”}
until ($strResponse -eq “Y”)


Write-Host "uso de for"
for ($i=1; $i -le 5; $i++)
{Write-Host $i}


$ints = @( 1, 2, 3, 4, 5)
for ($i=0; $i -le $ints.Length – 1; $i++)
{Write-Host $ints[$i]}


Write-Host "uso de foreach"
$ints = @(1, 2, 3, 4, 5)
foreach ($i in $ints)
{Write-Host $i}


#20
$ubicacion=gl
Write-Host "te encuentras en:" $ubicacion
Get-Help -Name Get-Process

#19
$cadena="Fernando Carraro"
Write-Host "Hola "$cadena
$cadena -match "aro"
$cadena -match "er"
$cadena -match "nando"


#18 ver fecha
$fecha=Get-Date
write-host "hoy es "$fecha

#17 ver ubicación
$variable=gl
"estas en: "
$variable


#16 Pedir nombre y mostrarlo
$nombre=Read-Host "tu nombre "
"Hola "
$nombre
Write-Host "hola "$nombre


#15
write-host
write-host "ShowPrnH.ps1,  Version 1.01"
write-host "Show available printers in HTML"
write-host "Written by Rob van der Woude"
write-host "http://www.robvanderwoude.com"
write-host

get-wmiobject -class Win32_Printer | convertto-html Name,Default,Network,PortName,DriverName,ServerName,ShareName -head "<title>All printers available on $env:computername</title>`n<style type=`"text/css`">`nbody { padding: 8px; line-height: 1.33 }`ntable { border-style: ridge }`ntd, th { padding: 10px; border-style: dotted; border-width: 1px }`nth { font-weight: bolder; text-align: center }`n</style>" | out-file -FilePath "showprnh.html" -Encoding "ASCII"
invoke-item "showprnh.html"


#14 una función

function ver{
   "estas en: "
  gl
}

ver


#13 operaciones básicas

$num1=99
$num2=32.33

"datos:"
$num1
$num2

$suma=$num1 + $num2
$resta=$num1 - $num2
$producto=$num1 * $num2
$division=$num1 / $num2


write-host "suma: $suma"
write-host "resta: $resta"
write-host "producto: $producto"
write-host "division: $division"


#12. 
write-host "Datos del sistema:"
New-Object System.io.DriveInfo "C:" | Format-List *
$drive = New-Object System.io.DriveInfo "C:"
$drive.DriveFormat
$drive.VolumeLabel


#11. Cómo mostrar el nombre de los archivos y el tamaño cuyo tamaño sea 79 bytes en powershell ?

gci |select name,length | where {$_.length -eq 76}


#10. Cómo mostrar el nombre de los archivos y el tamaño ordenados por tamaño
gci |select name,length |sort length –desc


#9. obtener una lista de archivos y guardarla en un archivo de texto *.txt

gci> listaArchivos.txt


#8. Crear una función
function mensaje{
 "hola desde una función"
} 
mensaje

#7. Operadores aritméticos y booleanos
$a=99
$b=2
Write-Host "a= $a  y b= $b"
$result=($a -lt $b)
write-host "($a -lt $b): $result"
$result=($a -gt $b) -or ($b -lt $a)
write-host "($a -gt $b) -or ($b -lt $a): $result"
$result=($a -eq $a) -and ($b -lt $a)
write-host "($a -eq $b) -and ($b -lt $a): $result"




#6.Operaciones básica: suma, resta , producto y división
$a=34
$b=25
$suma= $a+$b
$resta= $a-$b
$producto= $a*$b
$division= $a/$b
write "$a + $b = $suma"
write "$a - $b = $resta"
write "$a * $b = $producto"
write "$a / $b = $division"


#5. Introducir datos
$nombre=Read-Host "tu nombre es: "
Write-Host "bienvenido $nombre"

#4. definir una variable
$miVariable="soy una variable"
Write-Host $miVariable
echo $miVariable
$miVariable


#3. hola mundo con echo
echo "hola mundo desde PowerShell"

#2. hola mundo con write-host
Write-Host "hola mundo desde PowerShell"

# 1. hola mundo con comillas
"Hola mundo desde PowerShell"