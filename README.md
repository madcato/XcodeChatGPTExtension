# XcodeChatGPT

This project creates an Xcode extension that offers some functionality to the developer.

This code is based -and sometimes shamelessly copied–, from this [presentation at NSSPain23 -> 5 - Transforming Software Development Workflow: Leveraging AI and ChatGPT - Daniel Muñoz](https://vimeo.com/865564098), made by Daniel Muñoz @danmunoz@mastodon.social @makias .

## IMPORTANT: Configure OpenAI API key

To allow this project to work, you must configure two variables inside the `Configuration.swift` file:

```swift
/// This file is in the .gitignore to not to publish your api key.
struct Configuration {
    static let apiKey: String = "<set your OpenAI API key here>"
    static let gptModel: String = OpenApi.model.gpt4.rawValue
}

/// Defined in `OpenAIAPI.swift`
enum OpenAIAPI {
    enum model: String {
        case gpt4 = "gpt4"
        case gpt3_5_turbo = "gpt-3.5-turbo"
    }
}
```

## Install

1. git clone this project onto your macOS.
2. Build this project with Xcode. Change team and bundleId if needed.
3. Allow this extension to be loaded into Xcode in **System Settings** -> **Extensions** -> **Xcode Source Editor**.
4. Build and archive
5. Open organizer, then right click to select “show in finder”.
6. Show content of the archived file.
7. Drag Production/Application/XcodeChatGPT to your system Application folder

After installing and executing this extension will show new opctions into Xcode menu **Editor** -> **XcodeChatGPT** ->

## Functitonality

The folling commands are added to Xcode menu:

- Convert JSON to Codable struct
- Convert Codable struct to JSON
- Custom autocomplete
- Generate unit tests
- Generate documentation
- Custom command
- Code analysis to suggest improvements
