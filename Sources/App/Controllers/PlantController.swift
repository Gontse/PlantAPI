//
//  PlantController.swift
//  
//
//  Created by Gontse on 2024/07/01.
//

import Vapor


struct PlantController: RouteCollection {
  
  func boot(routes: any Vapor.RoutesBuilder) throws {
    let plantsRoute = routes.grouped("api", "plants")
    plantsRoute.post(use: createHandler)
    plantsRoute.get(use: getAllHandler)
    plantsRoute.get(":name", use: getHandler)
  }
  
  func createHandler(_ req: Request) throws -> EventLoopFuture<Plant> {
    let plant = try req.content.decode(Plant.self)
    return plant.save(on: req.db).map { plant }
  }
  
  func getAllHandler(_ req: Request) throws -> EventLoopFuture<[Plant]> {
    Plant.query(on: req.db).all()
  }
  
  func getHandler(_ req: Request) throws -> EventLoopFuture<Plant> {
    Plant.find(req.parameters.get("name"), on: req.db)
      .unwrap(or: Abort(.notFound))
  }
}
