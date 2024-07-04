//
//  CreatePlant.swift
//  
//
//  Created by Gontse on 2024/07/01.
//

import Fluent

struct CreatePlant: Migration {
  
  func prepare(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("plants")
      .id()
      .field("name", .string, .required)
      .create()
  }
  
  func revert(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("plants").delete()
  }
}
