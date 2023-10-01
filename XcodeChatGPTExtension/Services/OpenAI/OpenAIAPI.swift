//
//  OpenAIAPI.swift
//  jarvis
//
//  Created by Daniel Vela on 30/8/23.
//

enum OpenAIAPI {
    enum model: String {
      case gpt4 = "gpt-4"
      case gpt3_5_turbo = "gpt-3.5-turbo"
    }

  // - MARK: Query DTOs

  struct MessageQueryDto: Encodable {
    let role: String = "user"
    let content: String
  }

  struct CompletionQueryDto: Encodable {
    let model: String = Configuration.gptModel
    let messages: [MessageQueryDto]
  }

  // - MARK: Query DTOs

  struct MessageResponseDto: Decodable {
    let content: String
  }

  struct CompletionChoicesDto: Decodable {
    let message: MessageResponseDto
  }

  struct CompletionResponseDto: Decodable {
    let choices: [CompletionChoicesDto]

    var content: String? { choices.first?.message.content }
  }

  // - MARK: HTTP mthods

  static func completions(_ query: CompletionQueryDto? = nil) -> Http.Endpoint<CompletionResponseDto, CompletionQueryDto> {
    Http.Endpoint(
      method: .post,
      path: "/completions",
      body: query
    )
  }

  // - MARK: Response errors

  enum Error: Int, Swift.Error {
    case status401 = 401
    case status402 = 402
    case status429 = 429
    case status500 = 500
    case status503 = 503

    var description: String {
      switch self {
      case .status401, .status402:
        return "Invalid API Key. Ensure you had configured a correct OpenAI key in this app Settings. Type or paste it and press Enter, to ensure value is stored."
      case .status429:
        return "Rate limit exceeded"
      case .status500:
        return "Server has falied to provide an response. Wait some minutes to resubmit your request."
      case .status503:
        return "Server is overloaded. Wait a moment to resubmit your request."
      }
    }
  }
}
