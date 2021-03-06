//
//  StoryBoard.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//


import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        let identifier = String(describing: self)
        let vc = UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc as! Self
    }
}

extension UINavigationController: Storyboarded { }
extension UITabBarController: Storyboarded { }


enum Storyboard: String {
    case Main = "Main"
    
   
}
