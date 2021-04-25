var vscode = require('vscode')
const fs = require("fs")
const xml2js = require("xml2js")
const { Console } = require('console')
let path

function run() {
    
    findRootPath()
    GenerateXliffFiles()
}

function findRootPath(){
    path = vscode.workspace.workspaceFolders[0].uri.path
    path = path.substring(1)
}

function GenerateXliffFiles() {
    let appJSON = getAppJSON()
      
    const originalXliff = `${path}/Translations/${appJSON.name}.g.xlf`
    fs.readFile(originalXliff, 'utf8' , onXliffFileRead)
}

function getAppJSON() {
    let appJSON
    try {
        appJSON = JSON.parse(fs.readFileSync(`${path}/app.json`, 'utf8'))
    }
    catch (err) {
        vscode.window.showInformationMessage(err)
        return null
    }
    return appJSON
}

function onXliffFileRead(err, data) {
    if (err) {
        vscode.window.showInformationMessage(err)
        return
    }
    let parser = new xml2js.Parser()
    parser.parseString(data, parsed)
}

function parsed(err, result) {
    let appJSON = getAppJSON()

    if (err) {
        vscode.window.showInformationMessage(err)
        return
    }
    let Languages = ["es-ES","es-EStradnl"]
    for (let i = 0; i < Languages.length; i++) {
        let results = JSON.parse(JSON.stringify(result))
        results['xliff']['file'][0]['$']['target-language'] = Languages[i]
        let transUnits = results['xliff']['file'][0]['body'][0]['group'][0]['trans-unit']
        for (let j = 0; j < transUnits.length; j++) {
            for (const note of transUnits[j]['note']) {
                if (note['$']['from'] === 'Developer' && typeof note['_'] !== 'undefined') {
                    transUnits[j]['target'] = note['_'].toString()
                }
            }
        }
        let builder = new xml2js.Builder()
        let xml = builder.buildObject(results)
        fs.writeFile(`${path}\\Translations\\${appJSON.name}.${Languages[i]}.g.xlf`, xml, 'utf8', writeFileMsg)
    }
}

function writeFileMsg(err) {
    if (err) {
        vscode.window.showInformationMessage(`Error al crear fichero de traducción`)
        return
    }
    vscode.window.showInformationMessage(`Fichero de traducción creado :)`)
}
exports.run = run