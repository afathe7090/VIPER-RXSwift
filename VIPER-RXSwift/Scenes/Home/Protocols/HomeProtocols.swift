//
//  HomeProtocols.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
}


protocol HomeRouterProtocol: AnyObject { }


protocol HomeInputInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol? { get set}
}

protocol HomeOutputInteractorProtocol:AnyObject {}
