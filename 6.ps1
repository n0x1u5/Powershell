#Dibuja una piramide con la base del numero de asteriscos que le pongas como parametro
clear
function blanco {

    param([int]$espacios)
    foreach($e in 0..$espacios)
    {
        Write-Host -NoNewline " "
    }
}

function dibujar { 
    
    param([int]$lado)
    foreach($l in 1..$lado)
    {
        Write-Host -NoNewline "*"
    }
}

$anchura=Read-Host "Introduzca la anchura de la base de la piramide"
foreach($n in 1..$anchura) 
{
    if($n%2 -ne 0){
    blanco $((1+$anchura-$n)/2)
    dibujar $n
    Write-Host
    }
}
