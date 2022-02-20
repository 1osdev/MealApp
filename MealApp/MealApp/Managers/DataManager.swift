//
//  DataManager.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 19.02.22.
//

import Foundation
import UIKit

class DataManager {
    
    // MARK: Lifecycle

    private init() {
        meals = [Meal(name: "Пицца", price: 15.0, image: #imageLiteral(resourceName: "pizza")), // imageLiteral
                 Meal(name: "Кока-Кола", price: 3.0, image: #imageLiteral(resourceName: "cola")),
                 Meal(name: "Мороженое", price: 5.0, image: #imageLiteral(resourceName: "icecream"))]
    }

    // MARK: Internal

    static let shared = DataManager()

    var meals: [Meal]
}
