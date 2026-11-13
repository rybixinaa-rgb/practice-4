$lines = @(Get-Content -Encoding UTF8 'text.txt')

$result = @($lines[0..1]) + @($lines[3..($lines.Count-1)]) + @($lines[2])

$result | Set-Content -Encoding UTF8 'result.txt'