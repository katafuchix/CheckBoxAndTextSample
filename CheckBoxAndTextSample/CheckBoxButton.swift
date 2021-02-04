//
//  CheckBoxButton.swift
//  CheckBoxAndTextSample
//
//  Created by cano on 2021/02/04.
//

import UIKit
import Rswift

class CheckBoxButton: UIButton {

    override func awakeFromNib() {
        if #available(iOS 13, *) {
            if traitCollection.userInterfaceStyle == .dark {
                self.setImage(R.image.iconChOnDark(), for: .selected)
                self.setImage(R.image.iconChOffDark(), for: .normal)
            } else {
                self.setImage(R.image.iconChOn(), for: .selected)
                self.setImage(R.image.iconChOff(), for: .normal)
            }
        } else {
            self.setImage(R.image.iconChOn(), for: .selected)
            self.setImage(R.image.iconChOff(), for: .normal)
        }
        
        self.addTarget(self, action: #selector(CheckBoxButton.buttonClicked(_:)), for: .touchUpInside)
    }

    @objc func buttonClicked(_ sender: UIButton) {
        self.isSelected = !self.isSelected
     }

}
