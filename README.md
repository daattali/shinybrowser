<p align="center">

<h3 align="center">shinybrowser</h3>

<h4 align="center">Find out information about a user's web browser in Shiny apps
<br><br>
<a href="https://daattali.com/shiny/shinybrowser-demo/">Demo</a>
&middot;
by <a href="https://deanattali.com">Dean Attali</a>
</h4>

<p align="center">
<a href="https://github.com/daattali/shinybrowser/actions">
<img src="https://github.com/daattali/shinybrowser/workflows/R-CMD-check/badge.svg" alt="R build status" />
</a>
<a href="https://cran.r-project.org/package=shinybrowser">
<img src="https://www.r-pkg.org/badges/version/shinybrowser" alt="CRAN version" />
</a>
</p>

</p>

---

<!--<img src="inst/img/hex.png" width="170" align="right"/>-->

{shinybrowser} lets you easily detect a user's web browser information in Shiny apps.

The available information is: browser name (such as "Chrome" or "Safari") and version, device type (mobile or desktop), operating system (such as "Windows" or "Mac" or "Android") and version, and browser dimensions. See the [demo Shiny app](https://daattali.com/shiny/shinybrowser-demo/) online for an example.

**Need Shiny help? [I'm available for consulting](https://attalitech.com/).**<br/>
**If you find {shinybrowser} useful, please consider [supporting my work](https://github.com/sponsors/daattali) to unlock rewards\! ❤**

<p align="center">

<a style="display: inline-block;" href="https://github.com/sponsors/daattali">
<img height="35" src="https://i.imgur.com/034B8vq.png" /> </a>

<a style="display: inline-block;" href="https://paypal.me/daattali">
<img height="35" src="https://camo.githubusercontent.com/0e9e5cac101f7093336b4589c380ab5dcfdcbab0/68747470733a2f2f63646e2e6a7364656c6976722e6e65742f67682f74776f6c66736f6e2f70617970616c2d6769746875622d627574746f6e40312e302e302f646973742f627574746f6e2e737667" />
</a>

</p>

> This package is part of a larger ecosystem of packages with a shared vision: solving common Shiny issues and improving Shiny apps with minimal effort, minimal code changes, and straightforward documentation. Other packages for your Shiny apps:

| Package | Description | Demo |
|---|---|---|
| [shinyjs](https://deanattali.com/shinyjs/) | 💡 Easily improve the user experience of your Shiny apps in seconds | [🔗](https://deanattali.com/shinyjs/overview#demo) |
| [shinyalert](https://github.com/daattali/shinyalert) | 🗯️ Easily create pretty popup messages (modals) in Shiny | [🔗](https://daattali.com/shiny/shinyalert-demo/) |
| [shinyscreenshot](https://github.com/daattali/shinyscreenshot/) | 📷 Capture screenshots of entire pages or parts of pages in Shiny apps | [🔗](https://daattali.com/shiny/shinyscreenshot-demo/) |
| [timevis](https://github.com/daattali/timevis/) | 📅 Create interactive timeline visualizations in R | [🔗](https://daattali.com/shiny/timevis-demo/) |
| [shinycssloaders](https://github.com/daattali/shinycssloaders/) | ⌛ Add loading animations to a Shiny output while it's recalculating | [🔗](https://daattali.com/shiny/shinycssloaders-demo/) |
| [colourpicker](https://github.com/daattali/colourpicker/) | 🎨 A colour picker tool for Shiny and for selecting colours in plots | [🔗](https://daattali.com/shiny/colourInput/) |
| [shinydisconnect](https://github.com/daattali/shinydisconnect/) | 🔌 Show a nice message when a Shiny app disconnects or errors | [🔗](https://daattali.com/shiny/shinydisconnect-demo/) |
| [shinyforms](https://github.com/daattali/shinyforms/) | 📝 Easily create questionnaire-type forms with Shiny | WIP |

# Table of contents

TODO

{shinybrowser} can be useful for different cases when you want to know:
- Whether they are on Internet Explorer, and show a message suggesting a different browser
- Whether they are on a desktop or on mobile, for UI purposes
- Whether they are on Windows or MacOS so that you can show a different keyboard shortcut they need to use

On my current machine, the information returned is:

```
List of 5
 $ device    : chr "Desktop"
 $ browser   :List of 2
  ..$ name   : chr "Chrome"
  ..$ version: chr "87"
 $ os        :List of 2
  ..$ name   : chr "Windows"
  ..$ version: chr "10"
 $ dimensions:List of 2
  ..$ width : int 1920
  ..$ height: int 937
 $ user_agent: chr "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
```
