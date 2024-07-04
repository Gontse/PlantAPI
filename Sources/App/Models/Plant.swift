//
//  Plant.swift
//  
//
//  Created by Gontse on 2024/07/01.
//


import Fluent
import Vapor

final class Plant: Model {
  
  static let schema = "plants"
  
  @ID
  var id: UUID?
  
  @Field(key: "name")
  var name: String
  
  init() {}
  
  init(id: UUID? = nil, name: String) {
    self.name = name
  }
}

// MARK: - Content

extension Plant: Content { }
