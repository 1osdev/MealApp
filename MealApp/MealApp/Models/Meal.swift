//
//  Meal.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 17.02.22.
//

import Foundation

struct Meal {
    let name: String
    let price: String
    let image: String
    }

extension Meal {
    static func getMeals() -> [Meal] {
        [
            Meal(name: "Пицца",
                price: "15 BYN",
                image: "pizza"),
            Meal(name: "Кока -Кола",
                price: "3 BYN",
                image: "cola"),
            Meal(name: "Мороженое",
                price: "5 BYN",
                image: "icecream")
        ]
    }
}

