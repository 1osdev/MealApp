//
//  ViewController.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 17.02.22.
//

import UIKit

class MealViewController: UITableViewController {

    private let meals = Meal.getMeals()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let mealDetailVC = segue.destination as? MealDetailViewController else { return }
        let meal = meals[indexPath.row]
        mealDetailVC.meal = meal
    }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            meals.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let meal = meals[indexPath.row]
        content.text = meal.name
        content.secondaryText = meal.price
        content.image = UIImage(named: meal.image)
        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        cell.contentConfiguration = content
        return cell
    }
}

