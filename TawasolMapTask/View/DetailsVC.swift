//
//  DetailsVC.swift
//  TawasolMapTask
//
//  Created by Ahmad Eisa on 10/11/2021.
//

import UIKit
import JGProgressHUD

class DetailsVC: UIViewController , Storyboarded{
    
    //------------------------------------------
    // MARK: - properties
    //------------------------------------------
    var detailsViewModel: DetailsViewModel!
    
    
    var responseSHow = ""
    var eid: String?
    
    
    //------------------------------------------
    // MARK: -IBOutlets
    //------------------------------------------
    
    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var getUnitsBtn: UIButton!
    
    @IBOutlet weak var getAddressBtn: UIButton!
    
    @IBOutlet weak var calculateValuesBtn: UIButton!
    
    //------------------------------------------
    // MARK: - Life Cycle
    //------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "User Information"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTextView.text = responseSHow
        hideBtn()
        configureViewModel()
        bindData()
       
        
    }
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

        detailsTextView.contentOffset = .zero
    }
    
    //------------------------------------------
    // MARK: - Helpers
    //------------------------------------------
    private func configureViewModel() {
        
        detailsViewModel = DetailsViewModel()
        
    }
    
    private func bindData() {
        
        //1
        detailsViewModel.errorMessage.bind {[weak self] in
            
            guard let self = self else { return }
            guard let errorMessage = $0 else { return }
            
            DispatchQueue.main.async {
                Alert.showAlert(self, title: "Web Request ERROR", message: "\(errorMessage)")
                
            }
            
        }
        
        //2
        
        detailsViewModel.isLoading.bind {  [weak self]  in
            guard let self = self else { return }
            self.showHUD($0)
            $0 ? Helper.freezeUI() : Helper.activeUI()
        }
        
        
        //3
        
        
        
        detailsViewModel.prettyJsonGetUnits.bind { [weak self] in
            print("DEBUG: prettyJsonGetUnits: \($0)  ")
            guard let self = self else { return }
            
            guard let prettyJson = $0 else { return }
            self.title = "All Units"
            DispatchQueue.main.async {
                
                self.detailsTextView.text = prettyJson
                UIView.animate(withDuration: 0.3) {
                    self.getUnitsBtn.isHidden = true
                    self.getAddressBtn.isHidden = false
                }
                
            }
            
        }
        
        
        
        
        //4
        detailsViewModel.getUnitsModel.bind { [weak self]  in
            guard let self = self else { return }
            guard let getUnitsModel = $0 else { return }
            DispatchQueue.main.async {
                print("DEBUG: GetUnits Model: \(getUnitsModel) ")
                
            }
            
        }
        
        //5
        detailsViewModel.getAddressString.bind { [weak self] arrString in
            guard let self = self else { return }
            guard let strings = arrString else { return }
            self.title = "ALL Address"
            DispatchQueue.main.async {
                self.detailsTextView.text = "\(strings)"
                UIView.animate(withDuration: 0.3) {
                    self.getUnitsBtn.isHidden = true
                    self.getAddressBtn.isHidden = true
                    self.calculateValuesBtn.isHidden = false
                }
            }
            
        }
        
        //6
        
        detailsViewModel.getSensorsValues.bind { [weak self] dict in
            
            guard let self = self else { return }
            guard let dict = dict else { return }
            self.title = "ALL Sensors Values"
            DispatchQueue.main.async {
                self.detailsTextView.text = "\(dict)"
                UIView.animate(withDuration: 0.3) {
                    self.getUnitsBtn.isHidden = true
                    self.getAddressBtn.isHidden = true
                    self.calculateValuesBtn.isHidden = true
                    Alert.showAlert(self, title: "Success", message: "Process Is Completed Thank You ")
                }
            }
            
        }
        
        
    }
    
    func hideBtn(){
        
        getAddressBtn.isHidden = true
        calculateValuesBtn.isHidden = true
    }
    
    
    @IBAction func getUnitsActions(_ sender: Any) {
        
        guard let eid = Helper.getEid() else {
            return
        }
        
        detailsViewModel.eid = eid
        
    }
    
    @IBAction func getAddressActions(_ sender: Any) {
        guard let userId = Helper.getaUser_id() else { return }
        
        detailsViewModel.getAddress(userID: userId)
        
    }
    
    @IBAction func getCalculationsValuesActions(_ sender: Any) {
        guard let eid = Helper.getEid() else {
            return
        }
        detailsViewModel.getSensorsValues(eid: eid)
        
    }
    
    
}
