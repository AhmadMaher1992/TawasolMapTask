//
//  Alert.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import UIKit
//------------------------------------------
// MARK:-Alert+Block
//------------------------------------------

enum AlertAction{
    case Ok
    case Cancel
}

typealias AlertCompletionHandler = ((_ index:AlertAction)->())?
typealias AlertCompletionHandlerInt = ((_ index:Int)->())

class Alert:UIViewController{
    
    
    class func showAlert(_ vc: UIViewController,title:String?, message:String?){
        let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok", style:.default, handler:nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
        
    }
    
    class func showAlertWithHandler(_ vc: UIViewController,title:String?, message:String?, handler:AlertCompletionHandler){
        let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:"Ok", style:.default, handler: { (alert) in
            handler?(AlertAction.Ok)
        }))
        
        alert.addAction(UIAlertAction(title:"Cancel", style:.default, handler: { (alert) in
            handler?(AlertAction.Cancel)
        }))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    class func showAlertWithHandler(_ vc: UIViewController,title:String?, message:String?, okButtonTitle:String, cancelButtionTitle:String,handler:AlertCompletionHandler){
        
        let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title:okButtonTitle, style:.default, handler: { (alert) in
            handler?(AlertAction.Ok)
        }))
        
        alert.addAction(UIAlertAction(title:cancelButtionTitle, style:.default, handler: { (alert) in
            handler?(AlertAction.Cancel)
        }))
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    
    class func showAlertWithHandler(_ vc: UIViewController,title:String?, message:String?, buttonsTitles:[String], showAsActionSheet: Bool,handler:@escaping AlertCompletionHandlerInt){
        
        let alert = UIAlertController(title:title, message: message, preferredStyle: (showAsActionSheet ?.actionSheet : .alert))
        
        for btnTitle in buttonsTitles{
            alert.addAction(UIAlertAction(title:btnTitle, style:.default, handler: { (alert) in
                handler(buttonsTitles.index(of: btnTitle)!)
            }))
        }
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
}
