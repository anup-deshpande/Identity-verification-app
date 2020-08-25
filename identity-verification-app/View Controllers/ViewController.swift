//
//  ViewController.swift
//  identity-verification-app
//
//  Created by Anup Deshpande on 8/24/20.
//  Copyright © 2020 Anup Deshpande. All rights reserved.
//

import UIKit
import Persona

class ViewController: UIViewController {
    
    @IBOutlet weak var verifyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyles()
    }
    
    /// Starts the  persona Inquiry workflow
    @IBAction func verifyButtonTapped(_ sender: UIButton) {
        let config = InquiryConfiguration(templateId: constants.templateID, environment: .sandbox)
        Inquiry(config: config, delegate: self).start(from: self)
    }
    
    func setStyles(){
        verifyButton.backgroundColor = UIColor(red: 20/255, green: 62/255, blue: 233/255, alpha: 1)
        verifyButton.tintColor = .white
        verifyButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        verifyButton.layer.cornerRadius = 10
    }
}

//Mark: - Delegate methods for Persona Identity Inquiry
extension ViewController: InquiryDelegate{
    
    func inquirySuccess(inquiryId: String, attributes: Attributes, relationships: Relationships) {
        // Sucessfully verified identity
        // Navigate to documents view controller
        self.performSegue(withIdentifier: segueIdentifiers.presentDocumentSegue.rawValue, sender: self)
    }
    
    func inquiryFailed(inquiryId: String, attributes: Attributes, relationships: Relationships) {
        print("Failed")
    }
    
    func inquiryCancelled() {
        print("Cancelled")
    }
    
    func inquiryError(_ error: Error) {
        print("Error")
    }
    
    
}
