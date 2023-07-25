//
//  Utils.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import Foundation
import UIKit

class borderView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(hexString: "#404040").cgColor
    }
        
      
    }

class buttonEightCornerRadius : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        self.layer.cornerRadius = 8
       self.clipsToBounds = true
       
    }
    
}
