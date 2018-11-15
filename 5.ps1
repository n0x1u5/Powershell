#Tabla de multiplicar del numero pasado como parametro
clear
$numero=Read-Host "Introduce un numero"
foreach ($n in 1..10) {
    Write-Host $numero x $n = $($numero*$n)
}
