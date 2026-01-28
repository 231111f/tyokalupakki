function Luo-Kansio {
	param ([string]$nimi)

	if (-not(Test-Path -Path $nimi)) {
		New-Item -ItemType Directory -Path $nimi | Out-Null
	}
}

function Kirjoita-Loki {
    param (
        [string]$Viesti,
        [string]$Tiedosto = "loki.txt"
    )
    "$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) - $Viesti" | Out-File -FilePath $Tiedosto -Append -Force
}                                                                                                                                                       