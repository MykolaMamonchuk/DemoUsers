//
//  PostRouter.swift
//  DemoPostList
//
//  Created by MMU on 09.11.2022.
//

import Alamofire
import Foundation

enum PostEndpoint {
    case getUsersPosts
}

class PostRouter: BaseRouter {
    fileprivate var endPoint: PostEndpoint

    init(anEndpoint: PostEndpoint) {
        endPoint = anEndpoint
    }

    override var method: HTTPMethod {
        switch endPoint {
        case .getUsersPosts: return .get
        }
    }

    override var path: String {
        switch endPoint {
        case .getUsersPosts:
            return "SharminSirajudeen/test_resources/posts"
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
