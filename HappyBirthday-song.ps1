$BeepList = @(
    @{ Pitch = 1000; Length = 300; };
    @{ Pitch = 1000; Length = 200; };
    @{ Pitch = 1150; Length = 500; };
    @{ Pitch = 1000; Length = 500; };
    @{ Pitch = 1350; Length = 500; };
    @{ Pitch = 1250; Length = 800; };

    @{ Pitch = 1000; Length = 300; };
    @{ Pitch = 1000; Length = 200; };
    @{ Pitch = 1150; Length = 500; };
    @{ Pitch = 1000; Length = 500; };
    @{ Pitch = 1500; Length = 500; };
    @{ Pitch = 1350; Length = 800; };

    @{ Pitch = 1000; Length = 300; };
    @{ Pitch = 1000; Length = 200; };
    @{ Pitch = 2000; Length = 500; };
    @{ Pitch = 1700; Length = 500; };
    @{ Pitch = 1370; Length = 500; };
    @{ Pitch = 1225; Length = 500; };
    @{ Pitch = 1150; Length = 500; };
    @{ Pitch = 1800; Length = 300; };
    @{ Pitch = 1800; Length = 200; };
    @{ Pitch = 1700; Length = 500; };
    @{ Pitch = 1370; Length = 700; };
    @{ Pitch = 1500; Length = 500; };
    @{ Pitch = 1370; Length = 500; };
    );

foreach ($Beep in $BeepList) {
    [System.Console]::Beep($Beep['Pitch'], $Beep['Length']);
}

echo "FELIZ CUMPLEAÑOS ALEX !! "