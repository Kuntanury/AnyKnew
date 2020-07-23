//
//  HomeModel.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/18.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import Foundation

class TitleModel: Codable {
    
    let status: Int
    let msg: String
    let data: TitleDataModel?
    
    init() {
        self.status = 1
        self.msg = ""
        self.data = nil
    }
}

class TitleDataModel: Codable {
    let site: TitleDataSiteModel?
}

class TitleDataSiteModel: Codable {
    let site: String?
    let attrs: TitleDataSiteAttrsModel?
    let subs: Array<TitleDataSiteSubsModel>?
}

class TitleDataSiteSubsModel: Codable {
    let items: Array<TitleDataSiteSubsItemsModel>?
    let attrs: TitleDataSiteSubsAttrsModel?
}

class TitleDataSiteSubsItemsModel: Codable {
    //Common
    let iid: Int?
    let title: String?
    let new_tag: Bool?
    let add_date: TimeInterval?
    //baidu
    let more: String?
}

class TitleDataSiteSubsAttrsModel: Codable {
    let cn: String?
    let display: Int?
}

class TitleDataSiteAttrsModel: Codable {
    let url: String?
    let logo: String?
    let cn: String?
    let iter: Int64?
    
}
