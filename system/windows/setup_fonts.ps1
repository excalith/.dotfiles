$FontName = 'FiraCode'
$NerdFontsURI = 'https://github.com/ryanoasis/nerd-fonts/releases'

$WebResponse = Invoke-WebRequest -Uri "$NerdFontsURI/latest" -MaximumRedirection 0 -ErrorAction SilentlyContinue

$LatestVersion = Split-Path -Path $WebResponse.Headers['Location'] -Leaf

Invoke-WebRequest -Uri "$NerdFontsURI/download/$LatestVersion/$FontName.zip" -OutFile "$FontName.zip"

Expand-Archive -Path "$FontName.zip"

$ShellApplication = New-Object -ComObject shell.application
$Fonts = $ShellApplication.NameSpace(0x14)

Get-ChildItem -Path ".\$FontName" -Include '*.ttf' -Recurse | ForEach-Object -Process {
    $Fonts.CopyHere($_.FullName)
}
