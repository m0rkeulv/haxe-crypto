rd /d deploy.zip
zip -9 -r deploy.zip src test specs haxelib.json *.hxml *.md *.sh .gitignore
haxelib submit deploy.zip