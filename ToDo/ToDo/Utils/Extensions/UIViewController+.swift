//
//  UIViewController+.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit
import ProgressHUD

extension UIViewController {
    private static func instanceFromNib<T: UIViewController>(name: String? = nil) -> T {
        return T(nibName: name ?? String(describing: self), bundle: nil)
    }

    static func instantiate(name: String? = nil) -> Self {
        return instanceFromNib(name: name)
    }
    
    func showHud() {
        ProgressHUD.animationType = .circleSpinFade
        ProgressHUD.colorAnimation = .orange
        ProgressHUD.show()
    }
    
    func hideHud(_ delay: Double? = nil) {
        self.delayOperation(delay ?? 0) {
            ProgressHUD.dismiss()
        }
    }
    
    func showSucceed(_ text: String) {
        ProgressHUD.showSucceed(text, interaction: true)
    }
}
