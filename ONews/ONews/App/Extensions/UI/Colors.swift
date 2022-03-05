//
//  Colors.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

struct Colors {
    
    static var mainColor: UIColor {
        return UIColor(named: "MainColor") ?? .orange
    }
    
    static var secondaryColor: UIColor {
        return UIColor(named: "SecondaryColor") ?? .yellow
    }
}

extension UIColor {
    static func color(_ red: Int, green: Int, blue: Int, alpha: Float) -> UIColor {
        return UIColor(
            red: 1.0 / 255.0 * CGFloat(red),
            green: 1.0 / 255.0 * CGFloat(green),
            blue: 1.0 / 255.0 * CGFloat(blue),
            alpha: CGFloat(alpha))
    }
}
