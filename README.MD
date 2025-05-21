# Publish

This project includes two PowerShell scripts to help manage your release process using Git Flow.

## Available Commands

* `start-release.ps1` – Starts a new release.
* `finish-release.ps1` – Finishes the release and updates versioning.


## Installation

1. Place both scripts (`start-release.ps1` and `finish-release.ps1`) in a directory of your choice.
2. Add that directory to your system's environment variables for easy access from any location.

## Dependencies

* Requires a valid `package.json` file to read the current version.
* Depends on Git Flow (`git flow` CLI) for release management.

