//
//  HomeViewControllerCell.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/18.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func layoutSubviewsWithModel(model: HomeDataCatsSitesModel) -> Void {
        iconImageView.sd_setImage(with: URL.init(string: model.attrs?.logo ?? ""), completed: nil)
        titleLabel.text =  model.attrs?.cn ?? ""
    }
}
