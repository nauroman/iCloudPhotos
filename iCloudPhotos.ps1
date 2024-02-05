$folderPath = "C:\Users\user\Downloads"
$zipName = "iCloud Photos.zip"
$tempExtractPath = "C:\Users\user\Downloads\iCloud Photos" # Use a dedicated folder for extraction

Invoke-Item $folderPath

while ($true) {
    $zipFile = Get-ChildItem -Path $folderPath -Filter $zipName -ErrorAction SilentlyContinue
    if ($zipFile) {
        Write-Host "Found zip file: $($zipFile.FullName)"

        # Use a separate, safe location for extraction
        Expand-Archive -LiteralPath $zipFile.FullName -DestinationPath $tempExtractPath -Force
        
        # Move only image files back to the original folder
        Get-ChildItem -Path $tempExtractPath -Include "*.jpeg", "*.jpg", "*.png", "*.gif", "*.HEIC" -Recurse | 
            Copy-Item -Destination $folderPath -ErrorAction SilentlyContinue

        # Remove the zip file after processing
        Remove-Item -LiteralPath $zipFile.FullName -Force -ErrorAction SilentlyContinue

        Remove-Item -Path $tempExtractPath -Recurse -Force -ErrorAction SilentlyContinue

        Write-Host "Processed zip file and cleaned up temporary folder."
    }

    Start-Sleep -Seconds 2
}
