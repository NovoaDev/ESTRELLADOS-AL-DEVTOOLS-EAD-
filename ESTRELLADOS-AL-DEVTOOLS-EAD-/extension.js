var vscode = require('vscode')
var translations = require('./commands/translations')
var settings = require('./commands/settings')
var gitignores = require('./commands/gitignore')


function activate(context) {
	var translation = vscode.commands.registerCommand('extension.translation', function () {
		translations.run()
	})
	var setting = vscode.commands.registerCommand('extension.settings', function () {
		settings.run()
	})
	var gitignore = vscode.commands.registerCommand('extension.gitignore', function () {
		gitignores.run()
	})
	context.subscriptions.push(translation)
	context.subscriptions.push(setting)
	context.subscriptions.push(gitignore)
}

exports.activate = activate;