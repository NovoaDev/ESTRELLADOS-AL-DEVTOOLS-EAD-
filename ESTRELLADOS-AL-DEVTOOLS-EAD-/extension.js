var vscode = require('vscode')
var translations = require('./commands/translations')
var settings = require('./commands/settings')
var gitignores = require('./commands/gitignore')
var patternss = require('./commands/patterns')
var designpatternss = require('./commands/designpatterns')
var disasterpatternss = require('./commands/disasterpatterns')

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
	var patterns = vscode.commands.registerCommand('extension.patterns', function () {
		patternss.run()
	})
	var designpatterns = vscode.commands.registerCommand('extension.designpatterns', function () {
		designpatternss.run()
	})
	var disasterpatterns = vscode.commands.registerCommand('extension.disasterpatterns', function () {
		disasterpatternss.run()
	})
	context.subscriptions.push(translation)
	context.subscriptions.push(setting)
	context.subscriptions.push(gitignore)
	context.subscriptions.push(patterns)
	context.subscriptions.push(designpatterns)
	context.subscriptions.push(disasterpatterns)
}

exports.activate = activate;