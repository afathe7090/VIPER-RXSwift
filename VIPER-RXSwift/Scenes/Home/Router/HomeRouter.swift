//
//  HomeRouter.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func build()-> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        router.viewController = view
        view.presenter = presenter
        return view
    }
    
}
