//
//  Plant.swift
//  
//
//  Created by Gontse on 2024/07/01.
//


import Fluent
import Vapor

final class Plant: Model, Content {
  
  static let schema = "plants"
  
  @ID
  var id: UUID?
  
  @Field(key: "name")
  var name: String
  
  @Field(key: "description")
  var description: String
  
  init() {}
  
  init(id: UUID? = nil, name: String) {
    self.name = name
  }
}
