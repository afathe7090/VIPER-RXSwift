//
//  BrandCells.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import UIKit

class BrandCells: UITableViewCell {

    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Desgin UI
    //----------------------------------------------------------------------------------------------------------------
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.borderWidth = 1.5
        return view
    }()
    
    private lazy var brandNameLBL: UILabel = {
         let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    
    
    
}
