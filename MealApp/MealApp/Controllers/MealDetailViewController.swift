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
    @IBOutlet weak var showReviewsButton: UIButton!
    
    var index: Int!

    var meal: Meal {
        DataManager.shared.meals[index]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupUI(with: size)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //dest.index = index
        if let dest = segue.destination as? FeadBackViewController {
            dest.index = index
        }
        if let dest = segue.destination as? ReviewsTableVC {
            dest.index = index
        }
    }

    private func setupUI(with size: CGSize) {
        let isVertical = size.width < size.height
        mealStackView.axis = isVertical ? .vertical : .horizontal
        
        title = meal.name
        mealImageView.image = meal.image
        mealNameLabel.text = meal.name
        mealPriceLabel.text = String(meal.price) + " BYN"
        
        mealRatingLabel.text = meal.ratingBar
        
        let showReviewsButtonTitle = "Просмотреть (\(meal.feadbacks.count)) отзывов"
        showReviewsButton.setTitle(showReviewsButtonTitle, for: .normal)
        showReviewsButton.isEnabled = meal.feadbacks.count != 0
    }
}
