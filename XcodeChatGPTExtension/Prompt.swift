//
//  Prompt.swift
//  XcodeChatGPTExtension
//
//  Created by Daniel Vela on 1/10/23.
//

import Foundation

enum Prompt: String {
  case jsonToCodable
  case codableToJson
  case autocomplete
  case unitTest
  case documentation
  case custom
  case codeAnalysis

  func prompt(with input: String) -> String {
    switch self {
      case .jsonToCodable:
        return "Generate a Swift struct that conforms to the Codable protocol based on the given JSON. The names of the properties within the generated Swift struct should use camel-case formatting. Make sure to return only the Swift code, no explanation is required: \n\(input)"
      case .codableToJson:
        return "Generate a JSON file with three fake objects for the following Swift struct. Only respond with the json file. No explanation is needed: \n\(input)"
      case .autocomplete:
        return "Complete this code, no explanation is needed: \n\(input)"
      case .unitTest:
        return "Write unit test for the given Swift code: \n\(input)\nOnly respond with the code, no explanation is needed."
      case .documentation:
        return "Add in-line documentation to the following Swift code. Document each class, struct, enum and function, but only those who has not been already documented. Return only the code, no explanation is required:\n\(input)"
      case .custom:
        return "\(input)"
      case .codeAnalysis:
        return "Analyze this code and provide suggestions on how to improve it: \n \(input)"
    }
  }

}
