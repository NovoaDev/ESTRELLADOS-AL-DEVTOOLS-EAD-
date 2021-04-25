var vscode = require('vscode')
const fs = require("fs")
let ROOT_PATH

function run() {
    findRootPah()
    generateGitIgnore()
}

function findRootPah(){
    ROOT_PATH = vscode.workspace.workspaceFolders[0].uri.path
    ROOT_PATH = ROOT_PATH.substring(1)
}

function generateGitIgnore() {

    const gitignorePath = `${ROOT_PATH}/.gitignore`
	const gitignore = ".vscode/launch.json\n.vscode/rad.json\n.vscode/.altemplates/*\n.vscode/.alcache/*\n.vs/*\n.snapshots/*\n*.app"
	
	fs.writeFile(gitignorePath, gitignore, function (err) {})
}

exports.run = run