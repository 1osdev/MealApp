//
//  FeadBackViewController.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 18.02.22.
//

import UIKit

class FeadBackViewController: UIViewController {

    @IBOutlet var feadBackTextfield: UITextView!
    @IBOutlet var errorLbl: UILabel!
    @IBOutlet var ratingSegmented: UISegmentedControl!
    @IBOutlet var saveReviewButton: UIButton!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feadBackTextfield.delegate = self
    }
    
    @IBAction func saveFeadBack() {
        let feadBack = Feadback(text: feadBackTextfield.text,
            mark: Double(ratingSegmented.selectedSegmentIndex + 1))
        DataManager.shared.meals[index].feadbacks.append(feadBack)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: UITextViewDelegate

extension FeadBackViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feadBackTextfield {
            let isCountEnough = textView.text.count > 20
            saveReviewButton.isEnabled = isCountEnough
            errorLbl.isHidden = isCountEnough
        }
        return true
    }
}
