# Themeable
`Themeable` provides easy to setup theme management in your app. It doesn't use NotificationCenter.

## Installing

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate DirectoryWatcher into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "GianniCarlo/Themeable" ~> 1.0.0
```

Run `carthage update` to build the framework and drag the built `Themeable.framework` into your Xcode project.

## Usage

- Provide a theme manager that conforms to the protocol `ThemeProvider`.
- Any object that you want to react to the change of the new theme, should conform to the protocol `Themeable`
