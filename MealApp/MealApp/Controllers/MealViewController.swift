//
//  ViewController.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 17.02.22.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let cellManager = CellManager()

    var meals: [Meal] {
        DataManager.shared.meals
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowMealDetail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        guard let mealDetailVC = segue.destination as? MealDetailViewController else { return }  ВТОРОЙ ВАРИАНТ ПЕРЕХОДА НА СЛЕДУЮЩИЙ КОНТРОЛЛЕР
        let mealDetailVC = segue.destination as! MealDetailViewController
        mealDetailVC.index = indexPath.row
    }
    
    @IBAction func unwindToMailTableVC(_ unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
// MARK: UITableViewDataSource

extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let meal = meals[indexPath.row]
        cellManager.configure(cell, with: meal)

        return cell
    }
}
//        var content = cell.defaultContentConfiguration()
//        let meal = meals[indexPath.row]
//        content.text = meal.name
//        content.secondaryText = meal.price
//        content.image = UIImage(named: meal.image)
//        content.imageProperties.maximumSize = CGSize(width: 100, height: 100)
//        cell.contentConfiguration = content
//        return cell
//    }
