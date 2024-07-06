//
//  CreatePlantSeedData.swift
//  
//
//  Created by Gontse on 2024/07/06.
//

import Fluent
import Vapor

struct CreatePlantSeedData: Migration {
  
  func prepare(on database: any FluentKit.Database) -> EventLoopFuture<Void> {
    let plants = [
      Plant(
        name: "Rose",
        description: " A woody perennial flowering plant of the genus Rosa, known for its beautiful and fragrant flowers."),
      Plant(
        name: "Tulip",
        description: "A bulbous spring-flowering plant of the lily family, with boldly colored cup-shaped flowers.")
    ]
    return plants.create(on: database)
  }
  
  func revert(on database: any FluentKit.Database) -> EventLoopFuture<Void> {
    return Plant.query(on: database).delete()
  }
}






/*
| Plant Name        | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| Rose              | A woody perennial flowering plant of the genus Rosa, known for its beautiful and fragrant flowers. |
| Tulip             | A bulbous spring-flowering plant of the lily family, with boldly colored cup-shaped flowers. |
| Sunflower         | A large annual forb of the genus Helianthus, known for its large, bright yellow flower head. |
| Cactus            | A member of the plant family Cactaceae, native to the Americas, known for its thick, fleshy stems that store water. |
| Bamboo            | A giant woody grass that grows chiefly in the tropics, known for its rapid growth and strength. |
| Orchid            | A diverse and widespread family of flowering plants with blooms that are often colorful and fragrant. |
| Fern              | A member of a group of vascular plants that reproduce via spores and have neither seeds nor flowers. |
| Lavender          | A small aromatic evergreen shrub of the mint family, with narrow leaves and bluish-purple flowers. |
| Oak               | A large tree of the beech family, native to the Northern Hemisphere, known for its strength and longevity. |
| Maple             | A tree or shrub of the genus Acer, often recognized by its lobed leaves and vibrant fall colors. |
| Pine              | A coniferous tree of the genus Pinus, known for its long needles and cone-shaped seeds. |
| Aloe Vera         | A succulent plant species of the genus Aloe, known for its medicinal and skin-care properties. |

*/
