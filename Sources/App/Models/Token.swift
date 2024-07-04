//
//  Token.swift
//  
//
//  Created by Gontse on 2024/07/04.
//

import Vapor
import Fluent

final class Token: Model, Content {
  
  static let schema = "tokens"
  
  @ID
  var id: UUID?
  
  @Field(key: "value")
  var value: String
  
  @Parent(key: "UserID")
  var user: User
  
  init() { }
  
  init(id: UUID? = nil, value: String, userID: User.IDValue) {
    self.id = id
    self.value = value
    self.$user.id = userID
  }
  
}
