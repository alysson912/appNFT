//
//  UIView+Extension.swift
//  AppBackFront
//
//

import Foundation
import UIKit

extension UIView {
    // faz arredondamento em views
    func roundCorners(cornerRadiuns: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
    
}
