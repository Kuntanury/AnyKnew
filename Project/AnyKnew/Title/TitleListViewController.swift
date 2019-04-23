//
//  TitleListViewController.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/22.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import UIKit
import Alamofire

class TitleListViewController: UIViewController {
    
    var keySite: String = ""
    var titleModel: TitleModel = TitleModel()
    @IBOutlet weak var titleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requestData()
    }
    
    func requestData() -> Void {
        var request = URLRequest(url: URL(string: "https://www.anyknew.com/api/v1/sites/" + keySite)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        Alamofire.request(request).responseJSON {
            (response) in
            switch response.result {

            case .success( _) :

                let jsonDecoder = JSONDecoder()
                self.titleModel = try! jsonDecoder.decode(TitleModel.self, from: response.data!)
                if self.titleModel.status != 0 { return }
                self.titleTableView.reloadData()
                
                break
            case .failure( _):
                break
            }
        }
    }
}

extension TitleListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return titleModel.data?.site?.subs?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleModel.data?.site?.subs?[section].items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleListViewControllerCell
        cell.layoutSubviewsWithModel(model: (titleModel.data?.site?.subs?[indexPath.section].items?[indexPath.row] ?? nil)!)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let secView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 30))
        label.text = titleModel.data?.site?.subs?[section].attrs?.cn
        secView.addSubview(label)
        return secView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: SourceWebViewController = SourceWebViewController.init()
        vc.iid = String(titleModel.data?.site?.subs?[indexPath.section].items?[indexPath.row].iid ?? 0)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
