//
//  CreateUser.swift
//  
//
//  Created by Gontse on 2024/07/04.
//

import Fluent

struct CreateUser: Migration {
  
  func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
    database.schema("users")
      .id()
      .field("name", .string, .required)
      .field("username", .string, .required)
      .field("password", .string, .required)
      .unique(on: "username")
      .create()
  }
  
  func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
    database.schema("users").delete()
  }
}
