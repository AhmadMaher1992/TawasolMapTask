//
//  WKWebView.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 09/11/2021.
//

import UIKit
import WebKit

extension WKWebView {
    
    
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
    
    
}
