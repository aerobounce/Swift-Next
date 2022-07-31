
<h1 align="center">Swift Next</h1>
<h3 align="center">Swift syntax package in async/await era</h3>

<p align="center">
    <img src="https://img.shields.io/badge/Swift%20-5.6+-orange.svg"></img>
    <img src="https://img.shields.io/badge/Sublime%20Text-4+-green.svg"></img>
</p>

## Features

- Swift 5.6 support
    - Older Swift versions (deprecated or retired syntax) are not supported, and not in plan.
- Supports [Documentation Comment Syntax](https://github.com/apple/swift/blob/main/docs/DocumentationComments.md)
- Supports `MARK:` `TODO:` `FIXME:`
- Xcode-style Symbol List
- Ships with all the Swift snippets from Xcode tuned for Sublime Text
- Compatible with the new regex engine of Sublime Text

<img width="610" src="https://user-images.githubusercontent.com/10491362/174356891-ca7d6254-3a94-4a66-a65e-9a6ce261d0e4.png">
<img width="600" src="https://user-images.githubusercontent.com/10491362/174356902-3461b350-bfed-41fa-89e1-7a5d58a29362.png">

## Status

- [ ] Finish visual test against all the swift files in [apple/swift](https://github.com/apple/swift) repository
    - [x] `swift-5.6-RELEASE/benchmark`
    - [x] `swift-5.6-RELEASE/libswift`
- [ ] Resolve TODOs left in files
- [ ] Squash corner cases that scope goes wrong
- [ ] Remove commented matches left for debugging purpose
- [ ] Add tests
- [ ] Add build system (if cross-platform is possible?)
- [ ] Support swift-5.7-RELEASE
- [x] Better documentation markup support

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

> Minimize multiple words into a regex pattern

```sh
$ grex --no-anchors --capture-groups ...
```

## References

> If you are to create a syntax definition file for the first time without deep regex background like me, here's everything you need.

**Sublime Text**

- [Sublime Text — Syntax Definitions](https://www.sublimetext.com/docs/syntax.html)
- [Sublime Text — Scope Naming](https://www.sublimetext.com/docs/scope_naming.html)
- [Sublime Text Community Documentation](https://docs.sublimetext.io/)
- [sublimehq/Packages](https://github.com/sublimehq/Packages)
- [sublimehq/Packages — Syntax Development Tips/Advice #757](https://github.com/sublimehq/Packages/issues/757)

**Regular Expression**

- [regex101](https://regex101.com/)
- [Oniguruma syntax (operator) configuration](https://github.com/kkos/oniguruma/blob/master/doc/SYNTAX.md)

**Swift**

- [apple/swift](https://github.com/apple/swift)
- [The Swift Programming Language](https://docs.swift.org/swift-book/ReferenceManual/zzSummaryOfTheGrammar.html)
- [Swift Standard Library](https://developer.apple.com/documentation/swift/swift_standard_library)
- `.swiftinterface` files in: `/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/swift`
- [DougGregor/swift-concurrency-objc](https://github.com/DougGregor/swift-concurrency-objc)
- [textmate/swift.tmbundle](https://github.com/textmate/swift.tmbundle)
- [wbond/swift-for-sublime](https://github.com/wbond/swift-for-sublime) (`floating-point-literal` and `string-literal` are modified version of this package 🙏)
- [GregoryBL/SwiftSyntax](https://github.com/GregoryBL/SwiftSyntax)

## Other Fundamental Packages for Swift

- [LSP-SourceKit](https://github.com/sublimelsp/LSP-SourceKit)
- [Swift Format](https://github.com/aerobounce/Sublime-Swift-Format)

## License

- MIT
