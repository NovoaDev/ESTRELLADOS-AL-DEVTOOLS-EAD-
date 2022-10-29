# Create environment using the same data as always.
$DockerSettings = ".\settings.json"
$SettingsJson = Get-Content $DockerSettings -Raw -Encoding UTF8 | ConvertFrom-Json

# Container
$ContainerName = $SettingsJson.containerName
$LicenseFile = $SettingsJson.licenseFile
$OnPremVersion = $SettingsJson.onPremVersion
$Type = $SettingsJson.type

# User
$Auth = $SettingsJson.auth
$UserName = $SettingsJson.userName
$Password = ConvertTo-SecureString $SettingsJson.password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)

# Image
$artifactUrl = Get-BCArtifactUrl -type $Type -country "es" -version $OnPremVersion  

New-BCContainer -accept_eula `
                -accept_outdated `
                -updateHosts `
                -containername $containername `
                -licenseFile $licenseFile `
                -artifactUrl $artifactUrl `
                -auth NavUserPassword `
                -Credential $credential