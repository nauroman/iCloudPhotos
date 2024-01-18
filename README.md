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

## How to Create a Shortcut for a PowerShell Script

Follow these steps to create a desktop shortcut that runs a PowerShell script:

1. **Create a New Shortcut:**
   - Right-click on the Desktop (or any other preferred location).
   - Choose `New > Shortcut` from the context menu.

2. **Set Up the Shortcut:**
   - In the shortcut creation wizard, enter the following command:
     ```
     PowerShell.exe -ExecutionPolicy Bypass -File "C:\Users\user\Desktop\System\iCloudPhotos\iCloudPhotos.ps1"
     ```
     - `PowerShell.exe` starts PowerShell.
     - `-ExecutionPolicy Bypass` allows the script to run without changing the global execution policy.
     - `-File "C:\Users\user\Desktop\System\iCloudPhotos\iCloudPhotos.ps1"` specifies the path to your script.

3. **Finalize the Shortcut:**
   - Click `Next`, name your shortcut, and click `Finish`.

4. **Change the Shortcut Icon (Optional):**
   - Right-click on the shortcut and select `Properties`.
   - In the Properties window, click on `Change Icon`.
   - Choose an icon from the list or specify a custom icon file.

**Note:** Depending on the script content and system settings, you may need to run the shortcut as an administrator for proper execution.


## Running the iCloudPhotos.ps1 script at Windows startup

To have the `iCloudPhotos.ps1` script run every time Windows starts, you can use the Task Scheduler. Follow these steps:

1. Open Task Scheduler (you can search for it in the Start menu).
2. Click on "Create Basic Task...".
3. Name the task and add a description (optional).
4. For the "Trigger" select "When the computer starts".
5. For the "Action" select "Start a program".
6. In the "Program/script" field, input "powershell.exe".
7. In the "Add arguments" field, input `-ExecutionPolicy Bypass -File "C:\path\to\iCloudPhotos.ps1"`. Replace `"C:\path\to\iCloudPhotos.ps1"` with the actual path to your `iCloudPhotos.ps1` script.
8. Click "Next" and then "Finish".

Now, the `iCloudPhotos.ps1` script should run every time Windows starts.

## Requirements

* PowerShell 5.1 or later
* Access to the file system

## Disclaimer

This script is provided as-is, and you bear the risk of using it. No express warranties, guarantees, or conditions are provided.
