param(
	[Parameter(Mandatory = $true)]
	[string]$kansio	
)

. .\YhteisetFunktiot.ps1


try {
	Kirjoita-Loki "Valvonta alkoi"

	if (-not (Test-Path -Path $kansio)) {
		throw "Kansiota ei löytynyt: $Kansio"
}
	$maara = (Get-ChildItem $Kansio -File).Count
	Kirjoita-Loki "Tiedostoja on ${kansio}: $Maara"
	Write-Host "Tiedostoja on kansiossa ${Kansio}: $Maara"
}
catch {
	Kirjoita-Loki "Virhe Valvonnassa: $($_.Exception.Message)"
	Write-Output "Virhe: $($_.Exception.Message)"
}
   