//
//  PlantPrice.swift
//  
//
//  Created by Gontse on 2024/07/05.
//

import Fluent
import Vapor

final class PlantPrice: Model, Content {
  
  static let schema = "plant_prices"
  
  @ID(key: .id)
  var id: UUID?
  
  @Field(key: "price")
  var price: Double
  
  @Parent(key: "plant_id")
  var plant: Plant
  
  init() { }
  
  init(id: UUID? = nil, price: Double, plantID: UUID) {
    self.id = id
    self.price = price
    self.$plant.id = plantID
  }
}
