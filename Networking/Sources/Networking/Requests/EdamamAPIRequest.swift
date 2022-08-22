//
//  File.swift
//  
//
//  Created by Omar Ahmed on 22/08/2022.
//

import Foundation

import Alamofire
import Foundation

/// Represents Fakestore.com Endpoint
///
struct EdamamAPIRequest: URLRequestConvertible {

    /// HTTP Request Method
    ///
    let method: HTTPMethod

    /// URL Path
    ///
    let path: String

    /// Parameters
    ///
    let parameters: [String: Any]

    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - method: HTTP Method we should use.
    ///     - path: RPC that should be called.
    ///     - parameters: Collection of Key/Value parameters, to be forwarded to the Jetpack Connected site.
    ///
    init(method: HTTPMethod, path: String, parameters: [String: Any]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters ?? [:]
    }

    /// Returns a URLRequest instance reprensenting the current FakeStore Request.
    ///
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: APISettings.baseURL + path)!
        let request = try URLRequest(url: url, method: method, headers: nil)

        return try encoder.encode(request, with: parameters)
    }
}

// MARK: - FakeStore Request: Internal

//
private extension EdamamAPIRequest {

    /// Returns the Parameters Encoder
    ///
    var encoder: ParameterEncoding {
        return method == .get ? URLEncoding.queryString : URLEncoding.httpBody
    }
}
