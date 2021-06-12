var vscode = require('vscode')
const os = require('os')
CopyPattern = require('./patterns/Copy')

function run() {
    choosePattern().then(type => {
		findRootPah()

        let src = os.homedir
        src += "\\.vscode\\extensions\\ESTRELLADOS-AL-DEVTOOLS-EAD-\\resources\\design patterns\\"
        let dsc = `${ROOT_PATH}/src/`

        switch (type) {
            case 'Comentarios':
                src += "Comments\\"  
                dsc += "Comments/"
                break;
            case 'Bloqueado':
                src += "Blocked\\"  
                dsc += "Blocked/"
		        break;
            case 'Descripcion':
                src += "Description\\"  
                dsc += "Description/"
		        break;
            case 'Nos Series':
                src += "NosSerie\\"  
                dsc += "NosSeries/"
                break;
            case 'Dimensiones':
                src += "Dimensions\\"  
                dsc += "Dimensions/"
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
			createItem("Comentarios", "Extender Comment Line para agregar comentarios de otra tabla."),
            createItem("Bloqueado", "Agregar campo para bloquear registro."),
			createItem("Descripcion", "Agregar campos descripciones"),
            createItem("Nos Series", "Agregar campo con patron Nº de series."),
            createItem("Dimensiones", "Agregar campos dimensiones a un maestro."),
            createItem("Wip", "WIP")
		], options).then(target => {
			resolve(target.label)
		})
	})
}

exports.run = run