//
//  APIConstants.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Alamofire
import Foundation

struct APIConstants {
    static let baseURL = "https://my-json-server.typicode.com/"
    static let contentType = "application/json"
}

enum APIError: Error {
    case failedAPICall(String, code: Int)

    func errMessage() -> String {
        switch self {
        case let .failedAPICall(message, _):
            return message
        }
    }

    func errCode() -> Int {
        switch self {
        case let .failedAPICall(_, code):
            return code
        }
    }

    public var localizedDescription: String {
        return errMessage().isEmpty ? self.localizedDescription : errMessage()
    }

    public var statusCode: Int {
        return errCode()
    }
}
