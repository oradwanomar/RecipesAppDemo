//
//  File.swift
//  
//
//  Created by Omar Ahmed on 22/08/2022.
//

import Foundation

// MARK: - RecipeResponse
public struct RecipeModel:Codable {
    public let q: String
    public let from: Int
    public let to: Int
    public let more: Bool
    public let count: Int
    public let hits: [Hit]
}

// MARK: - Hit
public struct Hit:Codable {
    public let recipe: Recipe
}

// MARK: - Recipe
public struct Recipe:Codable {
    public let uri: String
    public let label: String
    public let image: String
    public let source: String
    public let url: String
    public let dietLabels: [String]
    public let healthLabels: [String]
    public let ingredientLines:[String]
}
