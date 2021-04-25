var vscode = require('vscode')
const fs = require("fs")
const fse = require('fs-extra')
const path = require("path")
const os = require('os')
CopyPattern = require('./patterns/Copy')

function run() {
    choosePattern().then(type => {
		findRootPah()

        let src = os.homedir
        src += "\\.vscode\\extensions\\Dynamizartic.AL-Tools\\resources\\patterns\\"
        let dsc = `${ROOT_PATH}/src/`

        switch (type) {
            case 'Configuración':
                src += "Setup\\"  
                dsc += "SetupExample/"
                break;
            case 'UpgradeTags':
                src += "UpgradeTags\\"  
                dsc += "UpgradeTagsExample/"
		        break;
            case 'ControllAddin':
                src += "ControllAddin\\"  
                dsc += "ControllAddinExample/"
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
		placeHolder: 'Seleccione nivel de configuración'
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
			createItem("Configuración", "Tabla + Pagina + CU Management"),
            createItem("UpgradeTags", "Etiquetas para gestionar CU Upgrade"),
			createItem("ControllAddin", "Embeber pagina"),
			
		], options).then(target => {
			resolve(target.label)
		})
	})
}

exports.run = run