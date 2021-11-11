//
//  ViewController.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 08/11/2021.
//

import UIKit
import WebKit
import JGProgressHUD



class MainVC: UIViewController {
    
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    
    var mainViewModel: MainViewModel!
    var webView: WKWebView!
    let header = "content-type"
    
    
    //------------------------------------------
    // MARK: - Life Cycle
    //------------------------------------------
    
    
    override func loadView() {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(self, name: "setToken")
        configuration.defaultWebpagePreferences = prefs
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebKit()
        configureViewModel()
        bindData()
    }
    
    
    
    
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    private func configureViewModel() {
        
        mainViewModel = MainViewModel()
        
    }
    
    private func bindData() {
        
        //1
        mainViewModel.errorMessage.bind {[weak self] in
            
            guard let self = self else { return }
            guard let errorMessage = $0 else { return }
   
            DispatchQueue.main.async {
                Alert.showAlert(self, title: "Web Request ERROR", message: "\(errorMessage)")
            
            }

        }
        
       //2
        
        mainViewModel.isLoading.bind {  [weak self]  in
            guard let self = self else { return }
            self.showHUD($0)
            $0 ? Helper.freezeUI() : Helper.activeUI()
        }
        
        
        //3
        
        mainViewModel.successToken.bind {  [weak self] in
            // 1
            guard let self = self else { return }
            guard $0 else { return }
            DispatchQueue.main.async {
                print("DEBUG: Successful GetInofOrmation")
            }
        }
        
        
        //4
        
        mainViewModel.prettyJson.bind { [weak self] in
            print("DEBUG: PRETTY: \($0)  ")
            guard let self = self else { return }
            guard let prettyJson = $0 else { return }
            DispatchQueue.main.async {
               
                let detailVC = DetailsVC.instantiate(from: .Main)
                detailVC.responseSHow = prettyJson
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
          
        }
        //5
        mainViewModel.userInfoModel.bind { [weak self]  in
            guard let self = self else { return }
            guard let userInfo = $0 else { return }
            DispatchQueue.main.async {
                Helper.SaveApitoken(token: userInfo.token)
                let detailsVC = DetailsVC.instantiate(from: .Main)
                detailsVC.eid = userInfo.eid ?? ""
            print("DEBUG: detailsVC.eid \(userInfo.eid ?? "") ")
            }
    
        }
        
     
        
        
    }
    
    func loadWebKit(){
        
        webView.load(URLs.loginURL)
        webView.allowsBackForwardNavigationGestures = true
        webView.customUserAgent = "iPad/Chrome/SomethingRandom"
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as? String , error == nil else { return }
                //    print("DEBUG: HTML: \n \(html)  ")
                
            }
        }
    }
    
    
    
    
    
}

//------------------------------------------
// MARK: -WKScriptMessageHandler
//------------------------------------------
extension MainVC: WKScriptMessageHandler {
    
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        print("DEBUG: MESSAGE: \(message) ")
        if (message.name == "setToken"){
            if let token = message.body as? String{
                print("DEBUG: Token: \(token)")
                
            }
            
        }
        print("Received message from native: \(message)")
    }
    
    
  
    
}



//------------------------------------------
// MARK: -WKNavigationDelegate
//------------------------------------------
extension MainVC: WKNavigationDelegate {
    
    
    /* This function will be invoked when the web view object start load the url page. */
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("DEBUG: Web view didStartProvisionalNavigation")
        
        
    }
    
    
    /* This function will be invoked when the web page content begin to return. */
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("DEBUG: Web view didCommit")
    }
    
    /* This function will be invoked when the page content returned successfully. */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
        
        if let url = webView.url?.absoluteURL{
            
            print("DEBUG: URL IS: \(url) ")
            
            if let token = url.valueOf("access_token") {
                print("DEBUG: Successfull Login  ")
                print("DEBUG: TOKEN: \(token) ")
                
                    //Go To Main Thread
                
                mainViewModel.token = token

             
            }
            
        }
        
    }
    
    
    
    
    /* This function will be invoked when the web view object load page failed. */
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Web view didFailProvisionalNavigation")
    }
    

    
}

//------------------------------------------
// MARK: -WKUIDelegate
//------------------------------------------
extension MainVC: WKUIDelegate{
    
    
    
    
}





