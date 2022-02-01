//
//  LoginRouter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 28/01/2022.
//

import Foundation
import UIKit


class LoginRouter: LoginRouterProtocol {
    
    var viewController: UIViewController?
    
    static func build()-> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        router.viewController = view
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func goToRegisterPage(){
        print("In Login Router")
        let registerVC = RegisterRouter.build() 
        viewController?.present(registerVC, animated: true, completion: nil)
    }
}
