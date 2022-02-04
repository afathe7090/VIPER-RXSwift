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
    var newsObservable: Observable<[Article]> { get }
    
    func viewDidLoad()
}


protocol HomeRouterProtocol: AnyObject { }


protocol HomeInputInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol? { get set}
    func fetchNews() async 
}

protocol HomeOutputInteractorProtocol:AnyObject {
    func successFetchNews(_ news: News)
    func failToFetchNews()
}
