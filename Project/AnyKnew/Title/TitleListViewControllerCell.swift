//
//  HomeViewControllerCell.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/18.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import UIKit
import SDWebImage

class TitleListViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var extLabel: UILabel!
    
    func layoutSubviewsWithModel(model: TitleDataSiteSubsItemsModel, indexPath: IndexPath) -> Void {
        titleLabel.text = String(indexPath.row + 1) + ". " +  model.title!
        extLabel.text = model.more
    }
}
