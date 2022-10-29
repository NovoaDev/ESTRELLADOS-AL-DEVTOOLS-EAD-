# Create environment using the same data as always.
$DockerSettings = ".\settings.json"
$SettingsJson = Get-Content $DockerSettings -Raw -Encoding UTF8 | ConvertFrom-Json

# Container
$ContainerName = $SettingsJson.containerName
$LicenseFile = $SettingsJson.licenseFile

Import-BCContainerLicense -licenseFile $LicenseFile -containerName $containerName -restart