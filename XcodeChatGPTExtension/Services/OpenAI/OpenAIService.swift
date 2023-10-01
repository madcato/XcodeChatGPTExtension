//
//  OpenAIService.swift
//  jarvis
//
//  Created by Daniel Vela on 30/8/23.
//

struct OpenAIServiceError: Error {
    var id: Int
    var description: String
}

class OpenAIService {
    private var openAIAPIClient = Http.Client(baseURL: "https://api.openai.com",
                                              basePath: "/v1/chat",
                                              defaultHeaders: ["Accept": "application/json",
                                                               "Authorization": "Bearer \(Configuration.apiKey)",
                                                               "Content-Type": "application/json"])

    func completions(_ query: OpenAIAPI.CompletionQueryDto) async throws -> String? {
        let response: OpenAIAPI.CompletionResponseDto = try await openAIAPIClient.request(OpenAIAPI.completions(query))
        return response.content
    }
}
