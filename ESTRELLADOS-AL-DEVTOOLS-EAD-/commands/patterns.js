var vscode = require('vscode')
const os = require('os')
CopyPattern = require('./patterns/Copy')

function run() {
    choosePattern().then(type => {
		findRootPah()

        let src = os.homedir
        src += "\\.vscode\\extensions\\ESTRELLADOS-AL-DEVTOOLS-EAD-\\resources\\architectural patterns\\"
        let dsc = `${ROOT_PATH}/src/`

        switch (type) {
            case 'Singleton':
                src += "Setup\\"  
                dsc += "Setup/"
                break;
            case 'Supplemental':
                src += "Supplemental\\"  
                dsc += "Supplemental/"
		        break;
            case 'Subsidiary':
                    src += "Subsidiary\\"  
                    dsc += "Subsidiary/"
                    break;
            case 'Compound':
                src += "Compound\\"  
                dsc += "Compound/"
		        break;
            case 'Rule':
                src += "Rule\\"  
                dsc += "Rule/"
                break;
            case 'Master':
                src += "Master\\"  
                dsc += "Master/"
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
			createItem("Singleton", "Tabla de configuración"),
            createItem("Supplemental And Subsidiary", "Tabla Suplementaria/Auxiliar/Subsidiaria"),
			createItem("Compound", "Tabla configuración compuesta"),
            createItem("Rule", "Tabla configuración reglas"),
            createItem("Master", "Tabla maestra"),
		], options).then(target => {
			resolve(target.label)
		})
	})
}

exports.run = run