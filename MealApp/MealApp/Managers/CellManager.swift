//
//  CellManager.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 19.02.22.
//

import UIKit

class CellManager {
    func configure(_ cell: UITableViewCell, with meal: Meal) {
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = String(meal.price) + " " + "BYN\n" + meal.ratingBar
        cell.imageView?.image = meal.image
        //cell.imageView?.image. = meal.image
        
    }
}
//content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
