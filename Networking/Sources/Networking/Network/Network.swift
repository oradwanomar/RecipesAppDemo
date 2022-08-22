//
//  File.swift
//  
//
//  Created by Omar Ahmed on 22/08/2022.
//

import Alamofire
import Foundation

public protocol Network {

    /// Executes the specified Network Request. Upon completion, the payload will be sent back to the caller as a Data instance.
    ///
    func responseData(for request: URLRequestConvertible, completion: @escaping (Result<Data, Error>) -> Void)

}
