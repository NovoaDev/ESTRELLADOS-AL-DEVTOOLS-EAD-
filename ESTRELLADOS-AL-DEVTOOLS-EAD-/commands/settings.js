var vscode = require('vscode')
const fs = require("fs")
let ROOT_PATH

function run() {
    chooseSettings().then(type => {
		findRootPah()
		const settigns = `${ROOT_PATH}/.vscode/settings.json`
		let settignsFile

        switch (type) {
            case 'Alta con ruleset':
				settignsFile = buildAltaRuleset()
				generateRuleset()
                break;
            case 'Alta':
				settignsFile = buildAlta()
                break;
            case 'Media':
				settignsFile = buildMedia()
                break;
            case 'Baja':
                settignsFile = BuildBaja()
                break;
          }

		  fs.writeFile(settigns, JSON.stringify(settignsFile, null, "  "), function (err) {})
    })
}

function findRootPah(){
    ROOT_PATH = vscode.workspace.workspaceFolders[0].uri.path
    ROOT_PATH = ROOT_PATH.substring(1)
}

function chooseSettings() {
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
			createItem("Alta con ruleset", "Pefijo + Analizadores + ordenar propiedades/variable + ruleset basico"),
            createItem("Alta", "Pefijo + Analizadores + ordenar propiedades/variables"),
			createItem("Media", "Prefijo con Analizadores de codigo"),
			createItem("Baja", "Solo prefijo"),
			
		], options).then(target => {
			resolve(target.label)
		})
	})
}

function buildAltaRuleset(){
	const json = {
		"al.enableCodeAnalysis": true,
		"al.codeAnalyzers": [
			"${CodeCop}",
			"${PerTenantExtensionCop}",
			"${analyzerFolder}BusinessCentral.LinterCop.dll"
		],
		"al.ruleSetPath": "./.vscode/ruleset.json",
		"CRS.AlSubFolderName": "src",
		"CRS.OnSaveAlFileAction": "Rename",
		"CRS.ExtensionObjectNamePattern": "<Prefix><BaseName>",
		"CRS.FileNamePatternExtensions": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePattern": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternPageCustomizations": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.ObjectNamePrefix": "PrefixSettingsJson",
		"editor.codeActionsOnSave": {
			"source.fixAll.al": true
			},
			"alOutline.codeActionsOnSave": [
			"SortProperties", "SortVariables"
			],
			"al-xml-doc.CheckObjectDocumentationInformationLevel": "Disabled",
			"al-xml-doc.CheckProcedureDocumentationInformationLevel": "Disabled"
	}
	return json
}

function generateRuleset() {
	const ruleSet = `${ROOT_PATH}/.vscode/ruleset.json`
	fs.writeFile(ruleSet, JSON.stringify(buildRulesetJson(), null, "  "), function (err) {})
}

function buildRulesetJson() {
	const json = {
		"name": "ruleset",
		"description": "Customization of the analyzer to exclude errors and warning",
		"rules": [
			{
				"id": "LC0009",
            	"action": "None",
            	"justification": "Activate cyclomatic complexity, initial value deactivated to activate with extension"
			},
			{
				"id": "AA0205",
				"action": "Error",
				"justification": "Change behavior to avoid leaving trash in the project - unassigned variable"
			},       
			{
				"id": "AA0206",
				"action":"Error",
				"justification": "Change behavior to avoid leaving trash in the project - initialized but not used"
			}
		]
	}
	return json
}

function buildAlta(){
	const json = {
		"al.enableCodeAnalysis": true,
		"al.codeAnalyzers": [
			"${CodeCop}",
			"${PerTenantExtensionCop}",
			"${analyzerFolder}BusinessCentral.LinterCop.dll"
		],
		"CRS.AlSubFolderName": "src",
		"CRS.OnSaveAlFileAction": "Rename",
		"CRS.ExtensionObjectNamePattern": "<Prefix><BaseName>",
		"CRS.FileNamePatternExtensions": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePattern": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternPageCustomizations": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.ObjectNamePrefix": "PrefixSettingsJson",
		"editor.codeActionsOnSave": {
			"source.fixAll.al": true
			},
			"alOutline.codeActionsOnSave": [
			"SortProperties", "SortVariables"
			],
			"al-xml-doc.CheckObjectDocumentationInformationLevel": "Disabled",
			"al-xml-doc.CheckProcedureDocumentationInformationLevel": "Disabled"
	}
	return json
}

function buildMedia(){
	const json = {
		"al.enableCodeAnalysis": true,
		"al.codeAnalyzers": [
			"${CodeCop}",
			"${PerTenantExtensionCop}"
		],
		"CRS.AlSubFolderName": "src",
		"CRS.OnSaveAlFileAction": "Rename",
		"CRS.ExtensionObjectNamePattern": "<Prefix><BaseName>",
		"CRS.FileNamePatternExtensions": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePattern": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternPageCustomizations": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.ObjectNamePrefix": "PrefixSettingsJson",
		"al-xml-doc.CheckObjectDocumentationInformationLevel": "Disabled",
		"al-xml-doc.CheckProcedureDocumentationInformationLevel": "Disabled"
	}
	return json
}

function BuildBaja(){
	const json = {
		"CRS.AlSubFolderName": "src",
		"CRS.OnSaveAlFileAction": "Rename",
		"CRS.ExtensionObjectNamePattern": "<Prefix><BaseName>",
		"CRS.FileNamePatternExtensions": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePattern": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.FileNamePatternPageCustomizations": "<ObjectNameShort>.<ObjectTypeShortPascalCase>.al",
		"CRS.ObjectNamePrefix": "PrefixSettingsJson",
		"al-xml-doc.CheckObjectDocumentationInformationLevel": "Disabled",
		"al-xml-doc.CheckProcedureDocumentationInformationLevel": "Disabled"
	}
	return json
}
exports.run = run