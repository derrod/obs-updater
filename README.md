# OBS Updater

This repository is a standalone version of the OBS Studio Updater.

The following changes have been made compared to the upstream version:
- Use MSBuild and vcpkg instead of cmake and custom deps
- Added Log window (by @notr1ch)
- Switched to curl + nghttp for HTTP/2 downloads

## Building

1. Follow the instructions here to set up vcpkg: https://learn.microsoft.com/en-us/vcpkg/get_started/get-started-msbuild?pivots=shell-powershell#1---set-up-vcpkg
2. Build solution in Visual Studio
