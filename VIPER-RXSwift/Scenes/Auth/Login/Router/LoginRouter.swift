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
    
    func goToRegisterVC_In_Router(){
        print("In Login Router")
        let rootNaviationRegister = UINavigationController(rootViewController: RegisterRouter.build())
        rootNaviationRegister.modalPresentationStyle = .fullScreen
        viewController?.present(rootNaviationRegister, animated: true, completion: nil)
    }
    
    func startToGoHomePage_In_Router(){
        let homeVC = UINavigationController(rootViewController: HomeRouter.build())
        homeVC.modalPresentationStyle = .fullScreen
        viewController?.present(homeVC, animated: true, completion: nil)
    }
    
}
