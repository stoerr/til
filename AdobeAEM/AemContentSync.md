# Content sync to / from JCR for Adobe AEM

Created 31-08-2023, last change 24-05-2025

## AEM Plugin for IntelliJ IDEA

The [AEM Plugin](https://plugins.jetbrains.com/plugin/9269-aem-ide) for Intellij
is a paid plugin, but has many nice features and is also able to sync automatically content from the local 
filesystem to the JCR in your local server - have a good look at the IntelliJ settings of the plugin for that.

## ui.frontend in archetype

See README.md there ; command line `npm run watch` watches JS/CSS permanently and rebuilds and redeploys.

## aemsync npm package

[aemsync](https://www.npmjs.com/package/aemsync) is command line tool to set up local file system to AEM server sync 
for a directory. 

Start it e.g. with `aemsync -v -w . -d 5000 -t http://admin:admin@localhost:5502` in the directory you want to be 
synchronized to the server.  The -t argument is only needed if it's a nonstandard port / username / password. If 
you're using IntelliJ it might be a nice idea to add this as an external tool (Settings -> Tools -> External Tools)
you can start in any directory you want to sync. (Set working directory to $FileDir$ for that.)

## repo tool

https://github.com/Adobe-Marketing-Cloud/homebrew-brews

brew install adobe-marketing-cloud/brews/repo

description [is here](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developer-tools/repo-tool)
This is a ftp like tool that allows uploading and downloading files, but no automatic synchronization.
