//
//  UIImage+Extension.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 04/02/2022.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(_ strURL: String){
        guard let handllingURL = (strURL).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{return}
        guard let imageURL = URL(string: handllingURL) else {return}
        
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageURL
                         , placeholder: UIImage(systemName: "RxSwift_Logo")
                         , options: [.transition(.fade(0.8))])
    }
}
