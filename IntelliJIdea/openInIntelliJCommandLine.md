# How to open files in IntelliJ from the MacOS command line

There is a nice way to do that with a shell script. If the argument is a file, it will open that in the current 
project. But if it's a directory, it'll create a new project containing that directory as root, so be careful 
whether that's what you want.

```
#!/bin/bash
  exec open -a 'IntelliJ IDEA' "$@"
```

Second possibility: IntelliJ has a program for that that has some more features (diff, merge, format etc.), but
is more difficult to call:

```
#!/bin/bash
# compare also https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#arguments

if [[ "$#" -eq 0 || "$1" == "--help" ]]; then
  echo "Additional usage see https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html#arguments"
  echo "Editor additional arg: --line 42"
  echo "Wait: --wait"
fi

exec "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@" 2>&1 | fgrep -v 'idea[' | fgrep -v use-idea-classloader | fgrep -v FilePartNodeRoot.trieDescend

# doesn't work: exec open -a "IntelliJ IDEA.app" --args "$@"
```
