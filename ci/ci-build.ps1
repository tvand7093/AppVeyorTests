# Restore nuget packages for the solution
nuget restore $env:solution
# Build the solution with minimal text output.
msbuild /verbosity:minimal $env:solution


# Determine the actual name of the package.
$branch = $env:APPVEYOR_REPO_BRANCH
$pr = $env:APPVEYOR_PULL_REQUEST_NUMBER

if($pr -ne "") {
   # Do nothing as this is a PR
   return
}

if($branch -eq "cert") {
    # Set beta version, rather than the production version name.
    $env:APPVEYOR_BUILD_VERSION += "-beta"
}
elseif($branch -ne "master") {
   # Must be a dev build.
   $env:APPVEYOR_BUILD_VERSION += "-dev"
}

# Build nuget package. 
Write-Host "Packaging nuget with name: $env:APPVEYOR_BUILD_VERSION"
Write-Host "version=$env:APPVEYOR_BUILD_VERSION"