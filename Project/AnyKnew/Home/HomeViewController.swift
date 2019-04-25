//
//  HomeViewController.swift
//  AnyKnew
//
//  Created by Kuntanury on 2019/4/16.
//  Copyright © 2019 Kuntanury. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var homeModel: HomeModel = HomeModel()
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBAction func settingButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let localData = UserDefaults.standard.object(forKey: "homeModel")

        if localData != nil {
            self.homeModel = try! JSONDecoder().decode(HomeModel.self, from: localData as! Data)
        }
        self.requestData()
    }

    func requestData() -> Void {
        var request = URLRequest(url: URL(string: "https://www.anyknew.com/api/v1/boot")!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(request).responseJSON {
            (response) in
            switch response.result {
                
            case .success( _) :
                
                self.homeModel = try! JSONDecoder().decode(HomeModel.self, from: response.data!)
                if self.homeModel.status != 0 { return }
                UserDefaults.standard.set(response.data!, forKey: "homeModel")
                self.homeTableView.reloadData()
                
                break
            case .failure( _):
                break
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeModel.data?.cats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeModel.data?.cats?[section].sites?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeViewControllerCell
        cell.layoutSubviewsWithModel(model: (homeModel.data?.cats?[indexPath.section].sites?[indexPath.row] ?? nil)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let secView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 30))
        label.text = homeModel.data?.cats?[section].attrs?.cname! ?? "" + " - " + (homeModel.data?.cats?[section].cat!)!
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
        let vc: TitleListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TitleListVC") as! TitleListViewController
        vc.title = homeModel.data?.cats?[indexPath.section].sites?[indexPath.row].attrs?.cn
        vc.keySite = homeModel.data?.cats?[indexPath.section].sites?[indexPath.row].site ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
