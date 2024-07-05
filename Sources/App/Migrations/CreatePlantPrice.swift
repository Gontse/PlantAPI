//
//  CreatePlantPrice.swift
//  
//
//  Created by Gontse on 2024/07/05.
//

import Fluent

struct CreatePlantPrice: Migration {
  
  func prepare(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("plant_prices")
      .id()
      .field("price", .double, .required)
      .field("plant_id", .uuid, .required, .references("plants", "id", onDelete: .cascade))
      .create()
  }
  
  
  func revert(on database: any Database) -> EventLoopFuture<Void> {
    database.schema("plant_prices").delete()
  }
}
