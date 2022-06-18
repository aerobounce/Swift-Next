
<h1 align="center">Swift Next</h1>
<h3 align="center">Modern Swift syntax definition for Sublime Text 4 in async/await era.</h3>

## The Goal

- Port the Grammar of Swift Language to `.sublime-syntax`
- Follow Xcode highlighting and behavior while retaining maximum integration with Sublime Text

## Features

- Well integrated with Sublime Text
- Basic documentation markup support
- Xcode style symbol list
- Includes Swift snippets imported from Xcode

<img width="610" src="https://user-images.githubusercontent.com/10491362/174356891-ca7d6254-3a94-4a66-a65e-9a6ce261d0e4.png">
<img width="600" src="https://user-images.githubusercontent.com/10491362/174356902-3461b350-bfed-41fa-89e1-7a5d58a29362.png">

## Status

- Initially created based on Swift 5.6 (some accepted / implemented proposals are supported in advance).
- Fully supported up to Swift 5.6 except corner cases which are assumed to be exist.
- Is under the manual visual test against all the swift files in [swift](https://github.com/apple/swift) repository.

**TODO**

- [ ] Resolve TODOs left in files
- [ ] Squash corner cases that scope goes wrong
- [ ] Remove commented matches left for debugging purpose
- [ ] Better documentation markup support
- [ ] Add tests
- [ ] Add build system (if cross-platform is possible?)

## Install

1. Download this repository
2. Move extracted directory into: Sublime Text → Preferences → Browse Packages... → "User" directory

## Development

**Editing Environment**

- Sublime Text 4
- [PackageDev](https://github.com/SublimeText/PackageDev)
- [SublimeLinter-contrib-sublime-syntax](https://github.com/FichteFoll/SublimeLinter-contrib-sublime-syntax)
- [LSP-yaml](https://github.com/sublimelsp/LSP-yaml)
- [LSP-json](https://github.com/sublimelsp/LSP-json)
- Formatted with LSP-yaml and LSP-json

**Tips**

- Find attributes in swiftinterface files
```sh
$ cd /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/swift
$ rg '@\w+' -g '*.swiftinterface' | subl
```

## References

**Official Documents and Tips**

- [Default Packages](https://github.com/sublimehq/Packages)
- [Syntax Definitions](https://www.sublimetext.com/docs/syntax.html)
- [Scope Naming](https://www.sublimetext.com/docs/scope_naming.html)
- [Syntax Development Tips/Advice](https://github.com/sublimehq/Packages/issues/757)

**Apple**

- [apple/swift](https://github.com/apple/swift)
- [The Swift Programming Language](https://docs.swift.org/swift-book/ReferenceManual/zzSummaryOfTheGrammar.html)
- [Swift Standard Library](https://developer.apple.com/documentation/swift/swift_standard_library)

**Community**

- [DougGregor/swift-concurrency-objc](https://github.com/DougGregor/swift-concurrency-objc)
- [textmate/swift.tmbundle](https://github.com/textmate/swift.tmbundle)
- [wbond/swift-for-sublime](https://github.com/wbond/swift-for-sublime) (`floating-point-literal` and `string-literal` are modified version of this package)
- [GregoryBL/SwiftSyntax](https://github.com/GregoryBL/SwiftSyntax)

## Other Fundamental Packages for Swift

- [LSP-SourceKit](https://github.com/sublimelsp/LSP-SourceKit)
- [Swift Format](https://github.com/aerobounce/Sublime-Swift-Format)

## License

- MIT
