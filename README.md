# XcodeChatGPT

This project creates an Xcode extension to offer some funcionality to the developer.

## IMPORTANT: Configuration

To allow this project to work, you must configure two variables inside the `Configuration.swift` file:

```swift
/// This file is in the .gitignore to not to publish your api key.
struct Configuration {
    static let apiKey: String = "<set your OpenAI API key here>"
    static let model: String = OpenApi.model.gp4.rawString
}

/// Defined in `OpenAPI.swift`
enum OpenAPI {
    enum model: String {
        case gpt4 = "gpt4"
        casr gpt35Turbo = "gpt-3.5-turbo"
    }
}
```

*If you don't set this variables correctly, a `fatalError` will close Xcode*

## Install

1. git clone this project onto your macOS.
2. Build this project with Xcode.
3. Allow this extension to be loaded into Xcode in **System Settings** -> **Extensions** -> **Xcode Source Editor**.

After installing this extension will show new opctions into Xcode menu **Editor** -> **XcodeChatGPT** ->


## Funcitonlity

- Convert JSON to Codable struct
- Convert Codable struct to JSON
- Generate tests
- Custom Complete
