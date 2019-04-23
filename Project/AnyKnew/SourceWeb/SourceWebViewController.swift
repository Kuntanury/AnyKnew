//
//  SourceWebViewController.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/16.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class SourceWebViewController: UIViewController {
    
    var iid: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "详情"
        let sourceWebView = WKWebView.init()
        self.view.addSubview(sourceWebView)
        
        sourceWebView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        sourceWebView.load(URLRequest.init(url: URL.init(string: "https://www.anyknew.com/go/" + iid)!))
    }
    
    
}
