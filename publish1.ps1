param(
    [ValidateSet("patch", "minor", "major")]
    [string]$bump = "patch"
)

# Bump version without tagging
npm version $bump --no-git-tag-version

# Read new version from package.json
$version = (Get-Content package.json | ConvertFrom-Json).version
Write-Host "New version: $version"

# Commit changes
git add .
git commit -m "Prepare for release $version"

# Start release
git flow release start $version

# Wait for user to press Enter
Read-Host -Prompt "Press Enter to finish the release"

# Finish release
git flow release finish $version
