//
//  CodableToJsonCommand.swift
//  XcodeChatGPTExtension
//
//  Created by Daniel Vela on 1/10/23.
//

import Foundation
import XcodeKit

class CodableToJsonCommand: NSObject, XCSourceEditorCommand, XcodeCommand {
  func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
    command(prompt: .codableToJson, with: invocation, completionHandler: completionHandler)
  }
}
