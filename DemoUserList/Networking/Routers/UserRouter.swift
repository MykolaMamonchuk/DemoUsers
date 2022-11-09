//
//  UserRouter.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Alamofire
import Foundation

enum UserEndpoint {
    case getUsers
}

class UserRouter: BaseRouter {
    fileprivate var endPoint: UserEndpoint

    init(anEndpoint: UserEndpoint) {
        endPoint = anEndpoint
    }

    override var method: HTTPMethod {
        switch endPoint {
        case .getUsers: return .get
        }
    }

    override var path: String {
        switch endPoint {
        case .getUsers:
            return "SharminSirajudeen/test_resources/users"
        }
    }

    override var parameters: Parameters? {
        switch endPoint {
        default: return nil
        }
    }

    override var keyPath: String? {
        return nil
    }

    override var encoding: ParameterEncoding? {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
