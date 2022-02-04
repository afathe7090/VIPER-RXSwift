//
//  BrandCells.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 03/02/2022.
//

import UIKit

class NewsCell: UITableViewCell {

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
    
    private lazy var feedNameLBL: UILabel = {
         let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    
    private lazy var actorFeedsLBL: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    
    private lazy var dateFeedsLBL: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var feedsImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [actorFeedsLBL,dateFeedsLBL])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    
    
    
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayoutCell()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    

   
     //MARK: - Helper Functions
    
    private func setLayoutCell(){
        selectionStyle = .none
        setBackView()
        setImageFeedLayout()
        setNameFeedLBLLayOut()
        setAutorLblLayout()
    }
    
    private func setBackView(){
        contentView.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            backView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    
    private func setImageFeedLayout(){
        contentView.addSubview(feedsImage)
        NSLayoutConstraint.activate([
            feedsImage.topAnchor.constraint(equalTo: backView.topAnchor,constant: 5),
            feedsImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 5),
            feedsImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -5)
        ])
    }
    
    
    private func setNameFeedLBLLayOut(){
        contentView.addSubview(feedNameLBL)
        NSLayoutConstraint.activate([
            feedNameLBL.topAnchor.constraint(equalTo: feedsImage.bottomAnchor,constant: 5),
            feedNameLBL.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 5),
            feedNameLBL.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -5),
            feedNameLBL.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    private func setAutorLblLayout(){
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: feedNameLBL.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 5),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant: -5),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor,constant: -5)
        ])
    }
    
    
    
    func setCell(news: Article){
        feedNameLBL.text = news.content
        dateFeedsLBL.text = news.publishedAt
        actorFeedsLBL.text = news.author
        feedsImage.setImage(news.urlToImage ?? "")
    }
    
    
    
}
