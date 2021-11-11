//
//  UUDProgress.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//


import UIKit
import JGProgressHUD
extension UIViewController{
    
    static let hud = JGProgressHUD(style: .extraLight)
    
    func showHUD(_ show: Bool , withText text: String? = "Loading..."){
        view.endEditing(true)
        
        UIViewController.hud.textLabel.text = text
        if show{
            UIViewController.hud.show(in: view)
        }else{
            UIViewController.hud.dismiss()
        }
        
    }
}
