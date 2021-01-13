# shinybrowser

Detect a user's web browser information in Shiny apps. See a demo of what information you get: https://daattali.com/shiny/shinybrowser-demo/

This is useful for different cases when you want to know:
- Whether they are on Internet Explorer, and show a message suggesting a different browser
- Whether they are on a desktop or on mobile, for UI purposes
- Whether they are on Windows or MacOS so that you can show a different keyboard shortcut they need to use

On my current machine, the information returned is:

```
List of 4
 $ device    : chr "Desktop"
 $ os        :List of 2
  ..$ name   : chr "Windows"
  ..$ version: chr "10"
 $ browser   :List of 2
  ..$ name   : chr "Chrome"
  ..$ version: chr "87"
 $ dimensions:List of 2
  ..$ width : int 1536
  ..$ height: int 722
```
