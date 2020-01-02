#Install-Module navcontainerhelper -force
#Import-Module navcontainerhelper
accept_eula = true
# Rutas y nombres
bcDockerImage = 'mcr.microsoft.com/businesscentral/sandbox:15.1.37881.39313-es-ltsc2019'
licenseFileUri = 'C:\Licencia${2:licencia}.flf'
containername = 'NombreContenedor'

# Usuarios
userName = "Usuario"
password = ConvertTo-SecureString -String "Pass" -AsPlainText -Force
credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList userName, password

New-BCContainer -accept_eula:accept_eula `
                 -containername containername `
                 -auth UserPassword `
                 -Credential credential `
                 -licenseFile licenseFileUri `
                 -includeAL `
                 -updateHosts `
                 -assignPremiumPlan `
                 -imageName bcdockerimage `
                 -useBestContainerOS