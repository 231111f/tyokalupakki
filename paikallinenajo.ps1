Invoke-Command -ComputerName localhost -ScriptBlock {
	Get-Date
}


$koneet = @("PC1", "PC2", "PC3")

Invoke-Command -ComputerName $koneet -ScriptBlock {
	hostname
	Get-Date
}