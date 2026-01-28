function Kirjoita-Loki {
    param (
        [string]$Viesti,
        [string]$Tiedosto = "loki.txt"
    )
    "$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) - $Viesti" | Out-File -FilePath $Tiedosto -Append -Force
}                                                                                                                                                       