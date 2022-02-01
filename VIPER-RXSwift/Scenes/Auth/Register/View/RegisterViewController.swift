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
    

    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Design
    //----------------------------------------------------------------------------------------------------------------
    
    private lazy var titlelabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Hello"
        lbl.font = UIFont.boldSystemFont(ofSize: 35)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var registerTitleLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Welcome to Register "
        lbl.font = UIFont.boldSystemFont(ofSize: 35)
        lbl.textColor = .white
        return lbl
    }()
    
    
    
     //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .black
        
        presenter.viewDidLoad()
        setLayOut()
    }
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Auto Layout
    //----------------------------------------------------------------------------------------------------------------

    private func setLayOut(){
        setWelcomeLablwLayOut()
        setWelcomeRegisterLabelLayOut()
    }
    
    private func setWelcomeLablwLayOut(){
        view.addSubview(titlelabel)
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setWelcomeRegisterLabelLayOut(){
        view.addSubview(registerTitleLabel)
        NSLayoutConstraint.activate([
            registerTitleLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10),
            registerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}
