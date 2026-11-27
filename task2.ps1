$employees = Get-Content "query1.txt" |
ForEach-Object {
$p = $_.Trim() -split '\s+'
[PSCustomObject]@{
Name = $p[3]
City = $p[6]
}
}

$names = Get-Content "query4.txt" |
Where-Object { $_ -match "FEB-91" } |
ForEach-Object { ($_.Trim() -split '\s+')[1] } |
Sort-Object -Unique

$cities = foreach ($name in $names) {
$found = $employees | Where-Object { $_.Name -eq $name }

if ($found) {
$found.City
} else {
Write-Warning "Employee not found: $name"
}
}

$cities | Sort-Object -Unique |
Set-Content -Encoding UTF8 "result2.txt"

Get-Content "result2.txt"

