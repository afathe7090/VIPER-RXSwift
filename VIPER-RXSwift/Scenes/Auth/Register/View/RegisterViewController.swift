//
//  RegisterViewController.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import UIKit

class RegisterViewController: UIViewController , RegisterViewProtocol{
    
    
     //MARK: -  Protocols 
    var presenter: RegisterPresenterProtocol!
    

     //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .yellow
        
        presenter.viewDidLoad()
    }
    


}
