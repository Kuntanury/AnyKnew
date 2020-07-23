//
//  HomeModel.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/18.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import Foundation


class HomeModel: Codable {
    
    let status: Int
    let msg: String
    let data: HomeDataModel?
    
    init() {
        self.status = 1
        self.msg = ""
        self.data = nil
    }
}

class HomeDataModel: Codable {
    let iters: Dictionary<String, Int>?
    let cats: Array<HomeDataCatsModel>?
    let alliter: Int64?
    let bespoke: Bool?
}

class HomeDataCatsModel: Codable {
    let cat: String?
    let sites: Array<HomeDataCatsSitesModel>?
    let attrs: HomeDataCatsSitesAttrsModel?
}

class HomeDataCatsSitesModel: Codable {
    let site: String?
    let attrs: HomeDataCatsSitesAttrsModel?
}

class HomeDataCatsSitesAttrsModel: Codable {
    let url: String?
    let logo: String?
    let cn: String?
    let cname: String?
    
}
