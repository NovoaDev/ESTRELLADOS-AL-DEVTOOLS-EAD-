var vscode = require('vscode')
const fse = require('fs-extra')
const os = require('os')

function run(Src, Dst) {
    try {
        fse.copySync(Src, Dst)
        } catch (err) {
        vscode.window.showInformationMessage('Error: ' + err)
        }
}

exports.run = run