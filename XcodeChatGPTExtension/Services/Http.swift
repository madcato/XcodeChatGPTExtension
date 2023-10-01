//
//  HttpRequest.swift
//  iOS-Boilerplate
//
//  Created by Daniel Vela Angulo on 22/11/2018.
//  Copyright © 2018 veladan. All rights reserved.
//

import Foundation

public enum Http {

  enum Constant {
    static let railsDefaultDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
  }

  public enum Result<Response> {
    case success(Response)
    case error(Int, String)
  }

  public enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
  }

  public enum Error: Swift.Error {
    case invalidResponse
    case information(code: Int, message: String)
    case redirection(code: Int, message: String)
    case client(code: Int, message: String)
    case server(code: Int, message: String)
  }

  // MARK: - Http Endpoint

  public typealias Parameters = [String: Any]
  public typealias Path = String

  public final class Endpoint<Response, Body> {
    let method: Method
    let path: Path
    let parameters: Parameters?
    let body: Body?
    let decode: (Data) throws -> Response
    let informationalStatusCodes = 100...199
    let validStatusCodes = 200...299
    let redirectionStatusCodes = 300...399
    let clientErrorStatusCodes = 400...499
    let serverErrorStatusCodes = 500...599

    public init(method: Method,
                path: Path,
                parameters: Parameters? = nil,
                body: Body? = nil,
                decode: @escaping (Data) throws -> Response) {
      self.method = method
      self.path = path
      self.parameters = parameters
      self.body = body
      self.decode = decode
    }
  }

  // MARK: - Http Request

  // class Request {
  //
  //    func baseUrl() -> String {
  //        return Configuration.serverURL + Configuration.basePath
  //    }
  //
  //    func endpointUrl(endpoint: String) -> String {
  //        return baseUrl() + endpoint
  //    }
  //
  //    func customHeaders() -> [String: String] {
  //        return [:]
  //    }
  //
  //    //    curl -H 'Content-Type: application/json'
  //    //        -H 'Accept: application/json'
  //    //        -H 'secret: aakjsdklfj;ajasdfghlkajsdkfj'
  //    //        -X POST http://localhost:3000/api/v1/employee_user/login -d "{\"email\":\"vela.dan@gmail.com\",
  //    //                                                                     \"password\":\"tQDJC43S1OmTvnitug9edA\"}"
  // }

}  // struct Http

// MARK: - Endpoint extensions

public extension Http.Endpoint where Response: Swift.Decodable, Body: Swift.Encodable {
  convenience init(method: Http.Method,
                   path: Http.Path,
                   parameters: Http.Parameters? = nil,
                   body: Body?) {
    self.init(method: method, path: path, parameters: parameters, body: body) {
      let decoder = JSONDecoder()
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = Http.Constant.railsDefaultDateFormat
      decoder.dateDecodingStrategy = .formatted(dateFormatter)
      return try decoder.decode(Response.self, from: $0)
    }
  }
}

public extension Http.Endpoint where Response == Void, Body: Encodable {
  convenience init(method: Http.Method,
                   path: Http.Path,
                   parameters: Http.Parameters? = nil,
                   body: Body?) {
    self.init(
      method: method,
      path: path,
      parameters: parameters,
      body: body) { _ in () }
  }
}
