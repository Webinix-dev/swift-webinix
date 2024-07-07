<div align="center">

![Logo](https://raw.githubusercontent.com/webinix-dev/webinix-logo/main/webinix_swift.png)

# Swift-Webinix

<!-- #### [Features](#features) · [Installation](#installation) · [Usage](#usage) · [Documentation](#documentation) · [Webinix](https://github.com/webinix-dev/webinix) -->

#### [Features](#features) · [Usage](#usage) · [Webinix](https://github.com/webinix-dev/webinix)

[build-status]: https://img.shields.io/github/actions/workflow/status/webinix-dev/swift-webinix/ci.yml?branch=main&style=for-the-badge&logo=swift&labelColor=414868&logoColor=C0CAF5
[license]: https://img.shields.io/github/license/webinix-dev/swift-webinix?style=for-the-badge&logo=opensourcehardware&label=License&logoColor=C0CAF5&labelColor=414868&color=8c73cc

<!-- [release-version]: https://img.shields.io/github/v/tag/webinix-dev/swift-webinix?style=for-the-badge&logo=webtrees&logoColor=C0CAF5&labelColor=414868&color=7664C6 -->

[![][build-status]](https://github.com/webinix-dev/swift-webinix/actions?query=branch%3Amain)
[![][license]](https://github.com/webinix-dev/swift-webinix/blob/main/LICENSE)

<!-- [![][release-version]](https://github.com/webinix-dev/swift-webinix/releases/latest) -->

> Use any web browser or WebView as GUI.\
> With Swift in the backend and modern web technologies in the frontend.

![Screenshot](https://raw.githubusercontent.com/webinix-dev/webinix-logo/main/screenshot.png)

</div>

## Features

- Parent library written in pure C
- Fully Independent (_No need for any third-party runtimes_)
- Lightweight ~200 Kb & Small memory footprint
- Fast binary communication protocol between Webinix and the browser (_Instead of JSON_)
- Multi-platform & Multi-Browser
- Using private profile for safety

## Usage

### Minimal Example

```swift
import SwiftWebinix

let doc = "<html><head><script src='webinix.js'></script></head> Hello World</html>"

let win = newWindow()

try! win.show(doc)

wait()
```

Find more examples in the [`Examples/`](https://github.com/webinix-dev/swift-webinix/tree/main/Examples) directory.

After cloning the repository, examples can be run from the repository root.

```sh
git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules \
  https://github.com/webinix-dev/swift-webinix.git
```

```sh
swift run CallSwiftFromJS
```

## UI & Web Technologies

[Borislav Stanimirov](https://ibob.bg/) discusses using HTML5 in the web browser as GUI at the [C++ Conference 2019 (_YouTube_)](https://www.youtube.com/watch?v=bbbcZd4cuxg).

<!-- <div align="center">
  <a href="https://www.youtube.com/watch?v=bbbcZd4cuxg"><img src="https://img.youtube.com/vi/bbbcZd4cuxg/0.jpg" alt="Embrace Modern Technology: Using HTML 5 for GUI in C++ - Borislav Stanimirov - CppCon 2019"></a>
</div> -->

<div align="center">

![CPPCon](https://github.com/webinix-dev/webinix/assets/34311583/4e830caa-4ca0-44ff-825f-7cd6d94083c8)

</div>

Web application UI design is not just about how a product looks but how it works. Using web technologies in your UI makes your product modern and professional, And a well-designed web application will help you make a solid first impression on potential customers. Great web application design also assists you in nurturing leads and increasing conversions. In addition, it makes navigating and using your web app easier for your users.

### Why Use Web Browsers?

Today's web browsers have everything a modern UI needs. Web browsers are very sophisticated and optimized. Therefore, using it as a GUI will be an excellent choice. While old legacy GUI lib is complex and outdated, a WebView-based app is still an option. However, a WebView needs a huge SDK to build and many dependencies to run, and it can only provide some features like a real web browser. That is why Webinix uses real web browsers to give you full features of comprehensive web technologies while keeping your software lightweight and portable.

### How Does it Work?

<div align="center">

![Diagram](https://github.com/ttytm/webinix/assets/34311583/dbde3573-3161-421e-925c-392a39f45ab3)

</div>

Think of Webinix like a WebView controller, but instead of embedding the WebView controller in your program, which makes the final program big in size, and non-portable as it needs the WebView runtimes. Instead, by using Webinix, you use a tiny static/dynamic library to run any installed web browser and use it as GUI, which makes your program small, fast, and portable. **All it needs is a web browser**.

### Runtime Dependencies Comparison

|                                 | WebView           | Qt                         | Webinix               |
| ------------------------------- | ----------------- | -------------------------- | ------------------- |
| Runtime Dependencies on Windows | _WebView2_        | _QtCore, QtGui, QtWidgets_ | **_A Web Browser_** |
| Runtime Dependencies on Linux   | _GTK3, WebKitGTK_ | _QtCore, QtGui, QtWidgets_ | **_A Web Browser_** |
| Runtime Dependencies on macOS   | _Cocoa, WebKit_   | _QtCore, QtGui, QtWidgets_ | **_A Web Browser_** |

## Wrappers

| Language                | Status         | Link                                                      |
| ----------------------- | -------------- | --------------------------------------------------------- |
| Go                      | ✔️             | [Go-Webinix](https://github.com/webinix-dev/go-webinix)         |
| Nim                     | ✔️             | [Nim-Webinix](https://github.com/webinix-dev/nim-webinix)       |
| Pascal                  | ✔️             | [Pascal-Webinix](https://github.com/webinix-dev/pascal-webinix) |
| Python                  | ✔️             | [Python-Webinix](https://github.com/webinix-dev/python-webinix) |
| Rust                    | _not complete_ | [Rust-Webinix](https://github.com/webinix-dev/rust-webinix)     |
| TypeScript / JavaScript | ✔️             | [Deno-Webinix](https://github.com/webinix-dev/deno-webinix)     |
| V                       | ✔️             | [V-Webinix](https://github.com/webinix-dev/v-webinix)           |
| Zig                     | _not complete_ | [Zig-Webinix](https://github.com/webinix-dev/zig-webinix)       |

## Supported Web Browsers

| Browser         | Windows         | macOS         | Linux           |
| --------------- | --------------- | ------------- | --------------- |
| Mozilla Firefox | ✔️              | ✔️            | ✔️              |
| Google Chrome   | ✔️              | ✔️            | ✔️              |
| Microsoft Edge  | ✔️              | ✔️            | ✔️              |
| Chromium        | ✔️              | ✔️            | ✔️              |
| Yandex          | ✔️              | ✔️            | ✔️              |
| Brave           | ✔️              | ✔️            | ✔️              |
| Vivaldi         | ✔️              | ✔️            | ✔️              |
| Epic            | ✔️              | ✔️            | _not available_ |
| Apple Safari    | _not available_ | _coming soon_ | _not available_ |
| Opera           | _coming soon_   | _coming soon_ | _coming soon_   |
