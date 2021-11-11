//
//  DetailsViewModel.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import Foundation


class DetailsViewModel{
    
    
    var eid: String?{
        
        didSet{
            
            guard let eid = eid else { return }
            getUnits(eid: eid)

        }
    }
    
    
    var errorMessage: Observable<String?> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    
    
    var successGetUnits: Observable<Bool> = Observable(false)
    var successGetAddress: Observable<Bool> = Observable(false)
    
    var prettyJsonGetUnits: Observable<String?> = Observable(nil)
   
  
    var getUnitsModel: Observable<GetUnitsResponse?> = Observable(nil)
    var getAddressString: Observable<[String]?> = Observable(nil)
    var getSensorsValues: Observable<[String:Double]?> = Observable(nil)
    
    //1
    
    func getUnits(eid: String){
        isLoading.value = true
        API.shared.getUnits(eid: eid) { response, error, prettyJson  in
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
            print("DEBUG: GET UNITS: \(response)  ")
            
            DispatchQueue.main.async {
                self.isLoading.value = false
                self.successGetUnits.value = true
                self.getUnitsModel.value = response
                self.prettyJsonGetUnits.value = prettyJson
            }
        }
    }

    //2
    func getAddress(userID: Int){
        isLoading.value = true
        API.shared.getAddress(userID: userID) { response, error, prettyJson in
            
            
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
                self.successGetAddress.value = true
                self.getAddressString.value = response
                
            }
        }
        
    }
    
    
    //3
    
    func getSensorsValues(eid: String ){
        isLoading.value = true
        API.shared.getSensorsValues(eid: eid) { dict, error, prettYString in
            
            if let error = error {
                print("DEBUG: Request Error: \(error) ")
                DispatchQueue.main.async {
                    self.errorMessage.value = error.localizedDescription
    
                    self.isLoading.value = false
                }
                
                return
            }
            guard let dict = dict else {
                DispatchQueue.main.async {
                    self.errorMessage.value = "No Information"
                    self.isLoading.value = false
                }
                return
                
            }
            
            DispatchQueue.main.async {
                self.isLoading.value = false
                self.successGetUnits.value = true
                self.getSensorsValues.value = dict
                
            }
            
            
            
        }
        
    }
    
    
}
