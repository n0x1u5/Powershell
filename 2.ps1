write-host "Dame un numero: "
read-host NUMERO
foreach ($N in 1..10) {write-host ($N*$NUMERO+$N); $N++}
