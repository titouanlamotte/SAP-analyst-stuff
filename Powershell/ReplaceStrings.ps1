$InputFiles = Get-Item "C:\Users\###\*.csv"
$OldString  = '#####'
$NewString  = '%%%%%'
$InputFiles | ForEach {
    (Get-Content -Path $_.FullName).Replace($OldString,$NewString) | Set-Content -Path $_.FullName
}