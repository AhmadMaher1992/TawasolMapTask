//
//  TextView.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 11/11/2021.
//

import UIKit


extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}
