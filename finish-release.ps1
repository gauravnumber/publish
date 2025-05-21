# Load version from saved file
if (-Not (Test-Path .release-version.txt)) {
    Write-Host "No release version found. Run start-release.ps1 first."
    exit 1
}

$version = Get-Content .release-version.txt

# Optional confirmation
Read-Host -Prompt "Press Enter to finish the release for version $version"

# Finish the git flow release
git flow release finish $version

# Clean up
Remove-Item .release-version.txt
