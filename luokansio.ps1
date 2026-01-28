param (
    [Parameter(Mandatory = $true)]
    [string]$JuuriKansio,

    [Parameter(Mandatory = $true)]
    [string[]]$Kansiot
)

# Ladataan lokifunktio
. .\YhteisetFunktiot.ps1

try {
    Kirjoita-Loki "Kansioiden luonti aloitettu"

    # Luo juurikansio jos ei ole
    if (-not (Test-Path $JuuriKansio)) {
        New-Item -ItemType Directory -Path $JuuriKansio | Out-Null
    }

    foreach ($k in $Kansiot) {
        $polku = Join-Path $JuuriKansio $k
        New-Item -ItemType Directory -Path $polku -Force | Out-Null
        Write-Host "Luotu kansio: $k"
        Kirjoita-Loki "Luotu kansio: $polku"
    }

    Write-Host "Valmis"
    Kirjoita-Loki "Kansioiden luonti valmis"
}

catch {
    Write-Error "Virhe: $($_.Exception.Message)"
    Kirjoita-Loki "Virhe kansioiden luonnissa: $($_.Exception.Message)"
}
