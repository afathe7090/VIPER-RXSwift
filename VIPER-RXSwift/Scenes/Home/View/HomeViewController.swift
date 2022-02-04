//
//  HomeViewController.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController,HomeViewProtocol {

    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Proberties
    //----------------------------------------------------------------------------------------------------------------
    
    private let bag = DisposeBag()
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Protocols
    //----------------------------------------------------------------------------------------------------------------
    
    var presenter: HomePresenterProtocol!
    

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Design UI
    //----------------------------------------------------------------------------------------------------------------
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Lyfe Cycle
    //----------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

//----------------------------------------------------------------------------------------------------------------
//=======>MARK: -   Extension
//----------------------------------------------------------------------------------------------------------------
extension HomeViewController  {
    
    
}
