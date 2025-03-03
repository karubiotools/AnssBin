# Windows Subsystem for Linux (WSL) User Manual

## **Introduction**
Windows Subsystem for Linux (WSL) allows you to run a Linux environment directly on Windows 10 without the need for a virtual machine or dual boot setup. This manual guides you through installing and using WSL.

---

## **System Requirements**
- Windows 10 version 1903 or later (Build 18362+).
- Administrator privileges.
- An active internet connection.

---

## **Step 1: Enable WSL**
### **Automatic Installation** (Recommended)
1. Open **PowerShell** as Administrator:
   - Press `Win + X`, then select **Windows PowerShell (Admin)**.
2. Run the following command:
   ```powershell
   wsl --install
   ```
   - This will enable WSL and install **Ubuntu** as the default Linux distribution.
3. Restart your computer if prompted.

### **Manual Installation**
If `wsl --install` does not work, enable WSL manually:
1. Enable the WSL feature:
   ```powershell
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   ```
2. Enable Virtual Machine Platform:
   ```powershell
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
   ```
3. Restart your PC.

---

## **Step 2: Install a Linux Distribution**
1. Open **Microsoft Store**.
2. Search for and install a Linux distribution, such as:
   - **Ubuntu**
   - **Debian**
   - **Kali Linux**
   - **OpenSUSE**
3. Once installed, launch it from the **Start menu**.

---

## **Step 3: Set Up Your Linux Distro**
1. Open the installed Linux application.
2. The setup process will take a few minutes.
3. Create a new UNIX user account and password.

---

## **Step 4: Set WSL Version (Optional)**
By default, **WSL 2** is used if supported. You can switch between WSL versions.

- To check your current WSL version, run:
  ```powershell
  wsl -l -v
  ```
- To switch to WSL 2:
  ```powershell
  wsl --set-version <Distro-Name> 2
  ```
  Example:
  ```powershell
  wsl --set-version Ubuntu 2
  ```
- To set WSL 2 as the default version:
  ```powershell
  wsl --set-default-version 2
  ```

---

## **Step 5: Start Using WSL**
- Open **PowerShell** or **Command Prompt**, then type:
  ```powershell
  wsl
  ```
- Or launch the installed Linux app from the **Start menu**.

---

## **Step 6: Install Additional Tools (Optional)**
To update package lists and install common utilities:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget -y
```

For development, you can install:
- Node.js: `sudo apt install nodejs -y`
- Python: `sudo apt install python3 -y`
- Docker: `sudo apt install docker.io -y`

---

## **Bonus: Install Windows Terminal (Optional)**
For a better command-line experience:
1. Open **Microsoft Store**.
2. Search for **Windows Terminal** and install it.
3. Launch **Windows Terminal** and select your Linux distribution.

---

## **Uninstalling WSL**
If you need to remove WSL:
1. Uninstall your Linux distribution from **Settings > Apps**.
2. Disable WSL features:
   ```powershell
   dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux
   dism.exe /online /disable-feature /featurename:VirtualMachinePlatform
   ```
3. Restart your PC.

---

## **Troubleshooting**
### **WSL Command Not Found**
- Ensure WSL is enabled by running:
  ```powershell
  wsl --list --verbose
  ```
- If not installed, run `wsl --install` again.

### **Linux Distro Not Launching**
- Restart your PC and try again.
- If the issue persists, reinstall the Linux distribution.

---

## **Conclusion**
You have successfully installed and set up WSL on Windows 10 or later. You can now run Linux commands and applications alongside Windows.

For more details, visit [Microsoft's WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/).
