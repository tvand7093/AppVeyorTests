# Restore nuget packages for the solution
nuget restore $env:solution
# Build the solution with minimal text output.
msbuild /verbosity:minimal $env:solution


# Determine the actual name of the package.
$branch = $env:APPVEYOR_REPO_BRANCH
$pr = $env:APPVEYOR_PULL_REQUEST_NUMBER
$version = $env:APPVEYOR_BUILD_VERSION

if($pr -ne $null) {
   # Do nothing as this is a PR
   return
}

if($branch -eq "cert") {
    # Set beta version, rather than the production version name.
    $version += "-beta"
}
elseif($branch -ne "master") {
   # Must be a dev build.
   $version += "-dev"
}

nuget pack $env:sdk_csproj -version "version=$$version"