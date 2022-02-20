//
//  Meal.swift
//  MealApp
//
//  Created by Дмитрий Смирнов on 17.02.22.
//

import UIKit

// MARK: - Meal

struct Meal {
    // MARK: Internal

    var name: String
    var price: Double
    var image: UIImage?

    var feadbacks: [Feadback] = []

    // Вычисляемые свойства которые помогают отображать данные
    
    var ratingBar: String {
        if let rating = rating {
            return String(repeating: "⭐️", count: Int(rating.rounded(.up))) // control + command + " "
        } else {
            return "There are no reviews yet"
        }
    }

    // MARK: Private

    private var rating: Double? {
        if feadbacks.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for rewiev in feadbacks {
                sum += rewiev.mark
            }
            return sum / Double(feadbacks.count)
        }
    }
}

// MARK: - Feedback

struct Feadback {
    
    private let date = Date()
    
    let text: String
    let mark: Double

    // Вычисляемые свойства которые помогают отображать данные
    
    var ratingBar: String {
        String(repeating: "⭐️", count: Int(mark.rounded(.up))) // control + command + " "
    }

    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}

