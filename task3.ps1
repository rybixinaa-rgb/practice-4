# Task 3. Variant 2

# Read simulated Linux permissions
$permissions = Import-Csv "permissions.csv"

# Find directories without public access
$private = $permissions |
Where-Object {
$_.Mode -match '^[0-7]{2}0$' -and
(Test-Path ".\student\$($_.Folder)" -PathType Container)
}

# Count directories
$count = @($private).Count

# Save the result
@(
"Directories without public access:"
$private | ForEach-Object { $_.Folder }
"Total: $count"
) | Set-Content -Encoding UTF8 "result3.txt"

# Display the result
Get-Content "result3.txt"

