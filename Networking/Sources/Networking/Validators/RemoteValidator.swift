//
//  File.swift
//  
//
//  Created by Omar Ahmed on 22/08/2022.
//

import Foundation

struct RemoteErrorValidator {

    /// Returns the DotcomError contained in a given Data Instance (if any).
    ///
    static func error(from response: Data) -> Error? {
        return try? JSONDecoder().decode(RemoteError.self, from: response)
    }
}

