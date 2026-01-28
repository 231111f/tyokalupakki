param (
    [string]$Kone = "localhost"
)

# Ladataan yhteiset funktiot
. .\YhteisetFunktiot.ps1

try {
    # Luodaan etäkomennot
    $Komennot = {
        $Aika = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $KoneNimi = $env:COMPUTERNAME
        return "Kone: $KoneNimi, Aika: $Aika"
    }

    if ($Kone -eq "localhost") {
        # Ajetaan paikallisesti
        $Tulos = & $Komennot
    }
    else {
        # Ajetaan etäyhteyden kautta
        $Tulos = Invoke-Command -ComputerName $Kone -ScriptBlock $Komennot
    }

    # Kirjoitetaan lokiin
    Kirjoita-Loki -Viesti $Tulos
}
catch {
    Kirjoita-Loki -Viesti "Virhe etäajossa koneessa ${Kone}: $_"
}
