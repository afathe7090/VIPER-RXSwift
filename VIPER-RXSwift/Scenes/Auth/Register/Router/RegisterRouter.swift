//
//  RegisterRouter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation
import UIKit


class RegisterRouter: RegisterRouterProtocol {
    
    var viewConteroller: UIViewController?
    
    static func build()-> UIViewController {
        print("In Build")
        let view = RegisterViewController()
        let router = RegisterRouter()
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter(view: view, router: router, interactor: interactor)
        router.viewConteroller = view
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
    
    
    
    
    
    
}
