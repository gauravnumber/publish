param(
    [ValidateSet("patch", "minor", "major")]
    [string]$bump = "patch"
)

# Bump version
npm version $bump --no-git-tag-version

# Extract and show version
$version = (Get-Content package.json | ConvertFrom-Json).version
Write-Host "New version: $version"

# Commit changes
git add .
git commit -m "Prepare for release $version"

# Start the git flow release
git flow release start $version

# Save version to a temp file for next step
$version | Out-File .release-version.txt

Write-Host "`nRelease started. Run 'finish-release.ps1' when you're ready to complete it."
