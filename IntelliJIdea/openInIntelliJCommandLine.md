# How to open files in IntelliJ from the MacOS command line

There is a nice way to do that with a shell script. If the argument is a file, it will open that in the current 
project. But if it's a directory, it'll create a new project containing that directory as root, so be careful 
whether that's what you want.

```
#!/bin/bash
  exec open -a 'IntelliJ IDEA' "$@"
```
