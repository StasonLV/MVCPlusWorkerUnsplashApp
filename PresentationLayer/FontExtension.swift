//
//  FontExtension.swift
//  MVCPlusWorkerUnsplashApp
//
//  Created by Stanislav Lezovsky on 26.06.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
    }
    
    convenience init(text: String, font: UIFont, textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
    }
}

