//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 18.02.22.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBOutlet weak var mealStackView: UIStackView!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealPriceLabel: UILabel!
    
    @IBOutlet weak var mealRatingLabel: UILabel!
    
    
    var meal: Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //extension MealDetailViewController {
        
    private func setupUI() {
        title = meal.name
        mealImageView.image = UIImage(named: meal.image)
        mealNameLabel.text = meal.name
        mealPriceLabel.text = meal.price
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
