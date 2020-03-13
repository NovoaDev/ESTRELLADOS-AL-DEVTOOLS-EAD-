# ESTRELLADOS AL DEVTOOLS EAD

Snippets creados para mejorar la experiencia de desarrollo de BC del grupo estrellados.

## Caracteristicas

AL
* Crear procesos para escribir en un campo blob.
* Crear procesos para leer un campo blob.
* Agregar comentario para firmar codigo.
* Agregar comentario para firmar codigo en varias lienas.
* Agregar complemento para Findset repeater.
* Crear campo en pagina con tooltip.
* Crear plantilla para Notificacion.
* Crear plantilla para cambiar color de los campos en paginas.
* Crea proceso para verificar si un numero es multiplo de alguno.
* Proceso para enviar correo.
* Suscripción a un evento para remplazar report.
* API insert/modify.
* Accion para cargar blob.

DOCKER
* Crear contenedor.
* Crear contenedor desde respaldo .bak. 
* Importar C/U de test.
* Extraer BaseApp desde un contenedor.
* Ver detalles de imagen antes de descargar.
* Ver ayuda navcontainerhelper.
* Copiar archivo de contenedor a local.
* Copiar archivo de local a contenedor.
* Importar licencia a contenedor.
* Agergar fuentes de Windows a un contenedor.
* Crear usuarios navcontainer.
* Desinstalar .app.
* Instalar .app.
* Actualizar .app.

HTTP
* Obtener todas las APis BC Aut Basica.
* Obtener todas las empresas Aut Basica.
* Obtener todos los registros Aut Basica.
* Insertar registro Aut Basica.
* Modificar registro Aut Basica.
* Eliminar registro Aut Basica.

-----------------------------------------------------------------------------------------------------------

## Snippets

* AL
    * `tblob escribir desde texto (EAD)` - Crear procesos para escribir en un campo blob.
    * `tblob obtener texto desde blob (EAD)` - Crear procesos para leer un campo blob.
    * `tfirma una línea (EAD)` - Agregar comentario para firmar codigo.
    * `tfirma multilínea (EAD)` - Agregar comentario para firmar codigo en varias lienas.
    * `tfindset recorrer record (EAD)` - Agregar complemento para Findset repeater.
    * `tcampo en pagina con tooltip (EAD)` - Crear campo en pagina con tooltip.
    * `tnotification (EAD)` - Crear plantilla para Notificacion.
    * `tcambiar color de campos en pagina (EAD)` - Crear plantilla para cambiar color de los campos en paginas.
    * `tutil numero es divisible (EAD)` - Muestra si un numero es multiplo de otro.
    * `tutil enviar mail (EAD)` - Procedimiento para enviar email.
    * `tutil reemplazar informe (EAD)` - Suscripción a un evento para remplazar report.
    * `tutil API insert/modify (EAD)` - API Insert/Modify.
    * `tutil accion cargar blob (EAD)` - Accion cargar blob.

* DOCKER
    * `tdocker crear contenedor BC (EAD)` - Crear contenedor.
    * `tdocker crear contenedor BC desde .bak (EAD)` - Crear contenedor desde respaldo .bak.
    * `tdocker importar codeunit y extensiones de test (EAD)` - Importar C/U de test.
    * `tdocker ver detalles de imagenes de Docker (EAD)` - Extraer BaseApp desde un contenedor.
    * `tdocker extraer codigo de la BaseAPP desde contenedor (EAD)` - Ver detalles de imagen antes de descargar.
    * `tdocker ver ayuda de navcontainerhelper (EAD)` - Ver ayuda navcontainerhelper.
    * `tdocker copiar archivo desde contenedor a local (EAD)` - Copiar archivo de contenedor a local.
    * `tdocker copiar archivo local a contenedor (EAD)` - Copiar archivo de local a contenedor.
    * `tdocker importar licencia (EAD)` - Importar licencia a contenedor.
    * `tdocker agregar fuentes de Windows a un contenedor (EAD)` - Agergar fuentes de Windows a un contenedor.
    * `tdocker crear usuario en contenedor (EAD)` - Crear usuarios navcontainer.
    * `tdocker desinstalar/despublicar app (EAD)` - Desinstalar .app.
    * `tdocker instalar app (EAD)` - Instalar .app.
    * `tdocker actualizar app (EAD)` - Actualizar .app.

* HTTP
    * `tapi Test APIs BC Aut basica (EAD)` - Test apis personalizadas BC.

####Ejemplos :
**`tdocker crear contenedor BC (EAD)`**
```powershell
#Install-Module navcontainerhelper -force
#Import-Module navcontainerhelper
# Rutas y nombres
$bcDockerImage = 'mcr.microsoft.com/businesscentral/sandbox:15.1.37881.39313-es-ltsc2019'
$licenseFileUri = 'C:\Licencia\licencia.flf'
$containername = 'NombreContenedor'
# Usuarios
$userName = "Usuario"
$password = ConvertTo-SecureString -String "Pass" -AsPlainText -Force
$credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $userName, $password

New-BCContainer -accept_eula `
                 -containername $containername `
                 -auth UserPassword `
                 -Credential $credential `
                 -licenseFile $licenseFileUri `
                 -includeAL `
                 -updateHosts `
                 -accept_outdated `
                 -assignPremiumPlan `
                 -imageName $bcdockerimage `
                 -useBestContainerOS
```

**`tcambiar color de campos en pagina (EAD)`**
```pascal
procedure fontColorChange(VAR styleColor: Text; Validations : Text)
// Para funcionar correctamente necesitamos:
// 1- Propiedad StyleExpr en los campos en los que queremos cambiar el estilo. Ejemplo: StyleExpr = fontStyle (Variable global de página).
// 2- Usa un disparador para llamar a nuestra función a la cual pasaremos como la variable global que asignamos a la propiedad StyleExpr.
// 3- Modifica el parámetro "Validación", el caso y los colores que queremos usar.
begin
    case Validations of
        'Soft Red':
            styleColor:= 'Attention';
        'Soft blue':
            styleColor := 'AttentionAccent';
        'Soft gray':
            styleColor := 'Subordinate';
        'Standard Black':
            styleColor := 'Standard';
        'Standard Blue':
            styleColor := 'StandardAccent';
        'Strong Black':
            styleColor := 'Strong';
        'Strong Blue':
            styleColor := 'StrongAccent';
        'Red strong':
            styleColor := 'Unfavorable';
        'Green':
            styleColor:= 'Favorable';
        'Yellow':
            styleColor := 'Ambiguous';
    end;
end;
```
## Release Notes

### 1.0.1
* Se agregaron los siguientes snippets:
    * AL - Verificar numero divisible.
    * AL - Proceso para enviar email.
    * AL - Suscripcion para remplazar reports.
    * AL - API insert/modify.
    * AL - Accion cargar blob.
    * HTTP - Test APIs personalizadas Aut basica.

* Se Modificaron los siguientes snippets:
    * Docker - Crear usuarios navcontainer.

### 1.0.0

* Versión inicial: se agregaron los siguientes snippets
    * Docker - Crear contenedor.
    * Docker - Crear contenedor desde respaldo .bak. 
    * Docker - Importar C/U de test.
    * Docker - Extraer BaseApp desde un contenedor.
    * Docker - Ver detalles de imagen antes de descargar.
    * Docker - Ver ayuda navcontainerhelper.
    * Docker - Copiar archivo de contenedor a local.
    * Docker - Copiar archivo de local a contenedor.
    * Docker - Importar licencia a contenedor.
    * Docker - Agergar fuentes de Windows a un contenedor.
    * Docker - Crear usuarios navcontainer.
    * Docker - Desinstalar .app.
    * Docker - Instalar .app.
    * Docker - Actualizar .app.
    * AL - Escribir blob.
    * AL - Leer blob.
    * AL - Firma.
    * AL - Firma multilinea.
    * AL - Findset repeater.
    * AL - Campo pagina con tooltip.
    * AL - Notificacion.
    * AL - Cambiar color de los campos en paginas.

**Enjoy!**

Good vibes <br>