# Clink CMD Starship Init
$filePath = [System.IO.Path]::Combine($env:LocalAppData, 'clink\starship.lua')
$fileContent = "load(io.popen('starship init cmd'):read('*a'))()"
New-Item -ItemType Directory -Force -Path (Split-Path $filePath)
Set-Content -Path $filePath -Value $fileContent

# Powershell Starship Init
Add-Content -Path $PROFILE -Value 'Invoke-Expression (&starship init powershell)'

