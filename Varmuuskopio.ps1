#Annetaan Lähde ja Kohde parametrit varmuuskopioinnille.
param (
    [Parameter(Mandatory = $True)] #Kysyy parametriä, jos sitä ei ole annettu
    [string]$Lahde,
    [string]$Kohde = "Varmuuskopio"
)

#Ladataan yhteisetfunktiot.ps1 käyttöön, josta voi kutsua funktiota
. .\YhteisetFunktiot.ps1

#Lisätään päivämäärä kohdekansioon nimeen
$paiva = Get-Date -Format "yyyyMMdd"
$Kohde = $Kohde-$Paiva"

#Funktiot tiedostojen kopioinnissa Lähtökansiosta maalikansioon
function Kopio-Tiedostot {
param (
	[string]$lahto,
	[string]$Maali
	)
	Copy-Item "$Lahto\*" $Maali -Recurse -Force -ErrorAction Stop
}

#Pääohjelma
try {
	Kirjoita-Loki "Varmuuskopionti aloitettu"

	if (-not (Test-Path -Path $Lahde)) {
		throw "Lähdekansiota ei löydy: $Lahde"
	}
	
	Luo-Kansio -Nimi $kohde
	Kopio-Tiedostot -Lahto $lahde -Maali $kohde

	Kirjoita-Loki "Varmuuskopiointi valmis: $Kohde"
Write-Host "Varmuuskopiointi onnistui -> $Kohde"
}
catch {
    Kirjoita-Loki "Virhe varmuuskopioinnissa: $($_.Exception.Message)"
    Write-Error "Virhe: $($_.Exception.Message)"
}