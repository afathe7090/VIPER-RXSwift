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
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Lyfe Cycle
    //----------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setNavigationBar()
        presenter.viewDidLoad()
        setTablViewLayout()
        setTableViewWithBind()
    }
    
    
    func setNavigationBar(){
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35)]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
    }

}

//----------------------------------------------------------------------------------------------------------------
//=======>MARK: -   Extension
//----------------------------------------------------------------------------------------------------------------
extension HomeViewController  {
    
    
    func setTablViewLayout(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    func setTableViewWithBind(){
        presenter.newsObservable
            .bind(to: tableView.rx.items(cellIdentifier: "NewsCell", cellType: NewsCell.self)){index , article , cell in
                print(article)
                cell.setCell(news: article)
            }.disposed(by: bag)
    }
    
    
}
