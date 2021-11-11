//
//  ViewModel.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import UIKit

class MainViewModel {
    
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    
    var token: String? {
        
        didSet{
            
            guard let token = token else { return }
            getUserInfo(token: token)
            
        }
    }
    
    
    
    var errorMessage: Observable<String?> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    
    var successToken: Observable<Bool> = Observable(false)
    var successGetUnits: Observable<Bool> = Observable(false)
    var prettyJson: Observable<String?> = Observable(nil)
    var userInfoModel: Observable<USerInfoResponse?> = Observable(nil)
    var getUnitsModel: Observable<GetUnitsResponse?> = Observable(nil)
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    
    //1
    func getUserInfo(token: String){
        
        isLoading.value = true
        
        API.shared.getUserInformation(token: token) { [weak self] response, error, prettyJson  in
            guard let self = self else { return }
            if let error = error {
                print("DEBUG: Request Error: \(error) ")
                DispatchQueue.main.async {
                    self.errorMessage.value = error.localizedDescription
                    
                    self.isLoading.value = false
                }
                
                return
            }
            
            guard let response = response else {
                DispatchQueue.main.async {
                    self.errorMessage.value = "No Information"
                    self.isLoading.value = false
                }
                return
                
            }
            
            DispatchQueue.main.async {
                self.isLoading.value = false
                self.successToken.value = true
                self.prettyJson.value = prettyJson
                self.userInfoModel.value = response
                
            }
            
            
            
            let eid = response.eid ?? ""
            let userId = response.user?.id
            
            DispatchQueue.main.async {
                Helper.saveEid(eid: eid)
                Helper.Saveuser_id(user_id: userId)
            }
          
            
            
        }
        
    }
    
    
    
}
