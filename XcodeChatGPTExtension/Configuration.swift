//
//  Configuration.swift
//  XcodeChatGPTExtension
//
//  Created by Daniel Vela on 1/10/23.
//

import Foundation

/// This file is in the .gitignore to not to publish your api key.
struct Configuration {
  static let apiKey: String = "<set your OpenAI API key here>"
  static let gptModel: String = OpenAIAPI.model.gpt4.rawValue
}
