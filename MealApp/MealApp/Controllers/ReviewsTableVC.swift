//
//  ReviewsTableVC.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 18.02.22.
//

import UIKit

class ReviewsTableVC: UITableViewController {

    var index: Int!

    var meal: Meal {
        DataManager.shared.meals[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meal.feadbacks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feadback = meal.feadbacks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewTableViewCell
        cell.dateLabel.text = feadback.dateString
        cell.rewievLabel.text = feadback.text
        cell.markLabel.text = feadback.ratingBar

//        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
//
//        cell.nameLbl.text = feedback.dateString
//        cell.textLbl.text = feedback.text
//        cell.ratingLbl.text = feedback.ratingBar
        return cell
    }
}
