param(
    [ValidateSet("patch", "minor", "major")]
    [string]$bump = "patch"
)

# 1. Login to npm (only needed once; optional here)
# npm login

# 2. Bump the version without tagging
npm version $bump --no-git-tag-version

# 3. Get the new version
$version = (Get-Content package.json | ConvertFrom-Json).version
Write-Host "New version: $version"

# 4. Start git flow release
git flow release start $version

# 5. Stage and commit version bump
git add .
git commit -m "Release $version"

# 6. Finish git flow release
git flow release finish $version

# 7. Push changes and tags to origin
# git push -u origin main --follow-tags

# 8. Ensure you're on main
# git checkout main

# 9. Publish the package
# npm publish --access public
