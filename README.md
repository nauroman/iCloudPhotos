# iCloud Photos Extractor

This PowerShell script is designed to continuously monitor a specific folder for a zip file named "iCloud Photos.zip". When the zip file is detected, it extracts the contents, copies any image files back to the original folder, and then deletes the zip file and the temporary extraction folder.

## How it Works

The script starts by defining three variables: `$folderPath`, `$zipName`, and `$tempExtractPath`. `$folderPath` is the directory that the script will monitor for the zip file. `$zipName` is the name of the zip file it's looking for. `$tempExtractPath` is a temporary directory where the zip file will be extracted.

The script then enters an infinite loop, which is indicated by `while ($true)`. Inside this loop, the script uses the `Get-ChildItem` cmdlet to search for the zip file in the specified folder. If the zip file is found, the script prints a message to the console indicating the full path of the zip file.

Next, the `Expand-Archive` cmdlet is used to extract the contents of the zip file to the temporary directory. The `-Force` parameter is used to overwrite any existing files in the temporary directory.

The script then uses `Get-ChildItem` again to find all image files (with extensions .jpeg, .jpg, .png, .gif) in the temporary directory and its subdirectories. These image files are copied back to the original folder using the `Copy-Item` cmdlet.

After the image files have been copied, the script deletes the original zip file using the `Remove-Item` cmdlet. The temporary directory is also deleted using `Remove-Item`.

Finally, the script prints a message to the console indicating that the zip file has been processed and the temporary folder has been cleaned up. The script then pauses for 3 seconds (using `Start-Sleep -Seconds 3`) before starting the next iteration of the loop. This pause helps to prevent the script from consuming too much CPU time.

## Usage

1. Modify the `$folderPath`, `$zipName`, and `$tempExtractPath` variables as needed.
2. Run the script in PowerShell.
3. The script will continuously monitor the specified folder for the specified zip file. When the zip file is detected, it will be processed as described above.

## Requirements

* PowerShell 5.1 or later
* Access to the file system

## Disclaimer

This script is provided as-is, and you bear the risk of using it. No express warranties, guarantees, or conditions are provided.
