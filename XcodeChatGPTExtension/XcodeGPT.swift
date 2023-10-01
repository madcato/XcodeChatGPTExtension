//
//  XcodeGPT.swift
//  XcodeChatGPTExtension
//
//  Created by Daniel Vela on 1/10/23.
//

import Foundation

struct XcodeGPT {
  static let service = OpenAIService()

  func perform(prompt type: Prompt, on text: String) async throws -> String? {
    let content = type.prompt(with: text)
    let query = OpenAIAPI.CompletionQueryDto(messages: [OpenAIAPI.MessageQueryDto(content: content)])
    if let response = try await XcodeGPT.service.completions(query) {
      return response
    } else {
      throw Http.Error.invalidResponse
    }
  }
}
