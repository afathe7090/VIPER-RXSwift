//
//  RegisterProtocols.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 01/02/2022.
//

import Foundation


protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol! { get set }
}

protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
    func viewDidLoad()
}

protocol RegisterRouterProtocol: AnyObject{
}

protocol RegisterInPutInteractorProtocol: AnyObject{
    var presenter: RegisterOutputInteractorProtocol? { get set }
}

protocol RegisterOutputInteractorProtocol: AnyObject{}
