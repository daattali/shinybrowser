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

## Table of contents
- [The problem](#problem)
- [Sponsors 🏆](#sponsors)
- [How to use](#usage)
- [Example](#example)
- [Convenience checker functions](#convenience)
- [Installation](#install)
- [Limitations](#limitations)
  - [Accuracy](#accuracy)
  - [Supported values](#supported)
  - [Mobile vs desktop vs tablet](#device_type)
  - [Width and height](#dimensions)


<h2 id="problem">The Problem</h2>

When building a Shiny app for other users, sometimes you might want to know some information about the user's browser and system. A few scenarios where this can be useful:

1. Your Shiny app is using an advanced browser functionality that isn't supported in Internet Explorer. If a user views your app on Internet Explorer, you want to show them a warning message that some functionality might not work.
2. Your app shows some text to the user and you want to show them a message with the keyboard shortcut for copying the text to their clipboard. You need to know whether the user is on Windows or Mac to decide what keyboard shortcut to use (ctrl+C vs command+C).
3. Your app contains a plot with a legend. If the user is on a wide enough screen, you want the legend to appear beside the plot, but if the screen is too narrow then you want the legend to appear below the plot.

In these situations, you want to detect information about the user's browser type (scenario 1), operating system (scenario 2), or browser dimensions (scenario 3).

{shinybrowser} gives you easy access to this information.

<h2 id="sponsors">Sponsors 🏆</h2>

Developing and maintaining many packages takes a lot of time. Please consider sponsoring this work! 

> There are no sponsors yet

[Become the first sponsor for
{shinybrowser}\!](https://github.com/sponsors/daattali/sponsorships?tier_id=39856)

<h2 id="usage">How to use</h2>

First you need to call `detect()` anywhere in the UI. This will initialize {shinybrowser} and run the script that attempts to detect all the user information and send it to Shiny.

Then you can use any of the {shinybrowser} functions to inquire about the user. You can use and `get_browser()`/`get_browser_version()` to get the browser name and version, `get_os()`/`get_os_version()` to get the operating system, `get_device()` to find out if the user is on mobile or desktop, and `get_width()`/`get_height()` to find out the browser dimensions.

All these values are reactive, so they must be accessed inside an `observe()`/`reactive()` or similar.

<h2 id="example">Example</h2>

To see what {shinybrowser} returns for your system, check the [demo Shiny app](https://daattali.com/shiny/shinybrowser-demo/). 

A simple example of using {shinybrowser} is below:

```
library(shiny)

ui <- fluidPage(
  shinybrowser::detect()
)

server <- function(input, output, session) {
  observe({
    str(shinybrowser::get_all_info())
  })
}

shinyApp(ui, server)
```

This app will print all the information retrieved by {shinybrowser} to your console. Notice that it's calling `get_all_info()`, which is a way to get all the information in one list instead of using the individual `get_*` functions.

On my current machine, the output from the app is:

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

Note that {shinybrowser} also returns the "user_agent" string, which you can access using `get_user_agent()`, but you generally shouldn't need to use this string.

<h2 id="convenience">Convenience checker functions</h2>

{shinybrowser} has a few convenience functions for very common checks. For example, there are many browsers, but often Internet Explorer is the problematic one. If you want to check for it you can use `is_browser_ie()`, which is just a shorthand for `get_browser() == "Internet Explorer"`. There are a few other similar `is_*` functions that can be used as a shortcut.

<h2 id="install">Installation</h2>

To install the stable CRAN version:

```
install.packages("shinybrowser")
```

To install the latest development version from GitHub:

```
install.packages("remotes")
remotes::install_github("daattali/shinybrowser")
```

<h2 id="limitations">Limitations</h2>

<h3 id="accuracy">Accuracy</h3>

It's important to understand there is no reliable way to detect the information in {shinybrowser} with 100% accuracy.

{shinybrowser} makes a best effort at identifying the most accurate information, but some browser/operating system combinations may be difficult to identify. Users can also use a variety of tools to deliberately spoof this information.

With that in mind, {shinybrowser} should detect the correct information in most cases.

<h3 id="supported">Supported values</h3>

Only major browsers and operating systems are supported, which means that the RStudio Viewer may result in an "UNKNOWN" browser, and unpopular operating systems may also result in "UNKNOWN". An operating system version is only detectable for Windows and for Mac OS X; all other operating systems will have an "UNKNOWN" version.

<h3 id="device_type">Mobile vs desktop vs tablet</h3>

For device type, {shinybrowser} attempts to detect whether a device is "mobile" or "desktop". The distinction between mobile and desktop is not always clear, so if what you actually care about is the size of the device, it might be better to use `get_width()`.

Tablets return ambiguous results; some tablets self-report as mobile devices while others as desktop.

<h3 id="dimensions">Width and height</h3>

The width and height of the browser window are only reported once, when the `detect()` function is initially called. If the user resizes the browser window, the new dimensions are not reported until the page is refreshed.


