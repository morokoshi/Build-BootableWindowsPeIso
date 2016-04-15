#
# Initialize.ps1
#

# スクリプトがあるフォルダー
$script:ProjectDirectoryPath = ""
$Global:BuildedWindowsPePath = "WindowsPE-%PlatformId%.iso"
$Global:BaseBatchPath = "Base\Base_BuildPe.txt"
$Global:CancelBatchPath = "Base\Base_BuildPe_RequestCancel.txt"
$Global:BaseExportReFromWimPath = "Base\Base_ExportReFromWim.txt"

# Build-Peコマンドのパス
$Global:BuildPeBatPath = "Build-Pe.bat"
$Global:CleanUpPeBatPath = "CleanUp-BuildedPe.bat"
$Global:ExportReBatPath = "Export-WindowsRe.bat"

# ADK関連のパス
$Global:DeploymentToolsPath = "Assessment and Deployment Kit\Deployment Tools\"
$Global:DandISetEnvPath = "DandISetEnv.bat"
$Global:WinPePath = "Assessment and Deployment Kit\Windows Preinstallation Environment\"
$Global:WinPeOcsDirectoryPath = "WinPE_OCs"
$Global:EfisysNoPromptPath = "Oscdimg\efisys_noprompt.bin"
$Global:CopyPePath = "copype.cmd"
$Global:MakeWinPEMediaPath = "MakeWinPEMedia.cmd"



# Ghostのパス
if ([Environment]::Is64BitProcess -eq $true)
{
    if ((Test-Path -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost) -eq $true)
    {
        $Global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Wow6432Node\Symantec\Ghost).InstallDir
        $Global:GhostPath = Join-Path $Global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base"
    }
}
else
{
    if ((Test-Path -Path HKLM:SOFTWARE\Symantec\Ghost) -eq $true)
    {
        $Global:GhostPath = $(Get-ItemProperty -Path HKLM:SOFTWARE\Symantec\Ghost).InstallDir
        $Global:GhostPath = Join-Path $Global:GhostPath "bootwiz\OEM\GSS\winpe\%PlatformId%\Base"
    }
}
