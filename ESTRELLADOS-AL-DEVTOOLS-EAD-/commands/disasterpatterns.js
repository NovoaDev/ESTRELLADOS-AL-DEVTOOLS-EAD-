var vscode = require('vscode')
const os = require('os')
CopyPattern = require('./patterns/Copy')

function run() {
    choosePattern().then(type => {
		findRootPah()

        let src = os.homedir
        src += "\\.vscode\\extensions\\ESTRELLADOS-AL-DEVTOOLS-EAD-\\resources\\disaster patterns\\"
        let dsc = `${ROOT_PATH}/src/`

        switch (type) {
            case 'UpgradeTags':
                src += "UpgradeTags\\"  
                dsc += "UpgradeTagsExample/"
		        break;
            case 'ControllAddin':
                src += "ControllAddin\\"  
                dsc += "ControllAddinExample/"
		        break;
			case 'ControllAddin':
					src += "ReplaceReports\\"  
					dsc += "ReplaceReports/"
					break;
            case 'Baja':
                break;
            }
            CopyPattern.run(src, dsc)
    })
}

function findRootPah(){
    ROOT_PATH = vscode.workspace.workspaceFolders[0].uri.path
    ROOT_PATH = ROOT_PATH.substring(1)
}

function choosePattern() {
	const options = ({
		canPickMany: false,
		ignoreFocusOut: true,
		placeHolder: 'Seleccione patrón'
	})
	const createItem = (label, description, picked = false) => {
		return {
			"label": label,
			"description": description,
			"picked": picked
		}
	}
	return new Promise((resolve) => {
		vscode.window.showQuickPick([
			createItem("UpgradeTags", "Ejemplo de upgrade tags"),
            createItem("ControllAddin", "Ejemplo de control Addin"),
			createItem("ReplaceReports", "Ejemplo remplazar report estandar parametrizado"),
		], options).then(target => {
			resolve(target.label)
		})
	})
}

exports.run = run