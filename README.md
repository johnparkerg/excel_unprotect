# Unprotect Your Forgotten Password Protected Spreadsheet (.xlsx, .xlsm)

This script helps you **remove password protection** from spreadsheet files (.xlsx, .xlsm) that you own and forgot the password to. It's important to understand that this script does not break passwords on files you don't own.

### Before you begin:

- Make sure you have the permission to remove password protection from these files.
- This script modifies the original files. It's recommended to back up your files before running the script.

### Requirements:

- **Operating System:** macOS or Linux
- **Command Line:** Basic understanding of using the command line is helpful, but not essential.

### Instructions:

#### Save the script:

1. Open a text editor (e.g., Notepad, TextEdit, etc.).
2. Copy and paste the script provided below into the editor.
3. Save the file with a name like `unprotect_sheets.sh` (make sure the filename ends with `.sh`).

#### Make the script executable:

1. Open a terminal window (e.g., Command Prompt, Terminal, etc.).

2. Navigate to the directory where you saved the script using the `cd` command.

3. Type the following command and press Enter:

```bash
chmod +x unprotect_sheets.sh
```
4. In the terminal window, type the following command and press Enter:

```bash
./unprotect_sheets.sh <your_file.xlsx>
```
Replace <your_file.xlsx> with the actual path and filename of your password-protected spreadsheet file.


### The script will:

- Extract the contents of your file to a temporary location.
- Remove the password protection information from the extracted files.
- Create a new file named <your_file>_unprotected.<extension> (e.g., my_report_unprotected.xlsx) containing the unprotected files.
- Delete the temporary files.

You can now open the new, unprotected zip file using your spreadsheet software.

Additional Notes:

- This script removes various types of password protection that may be applied to spreadsheet files.
- If the script doesn't work for your specific file, it's possible that the password protection method used is not supported.
- Using this script on files you don't own is not recommended and may be illegal.
