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
    var segmentedControl: UISegmentedControl = UISegmentedControl()
    var selectedSegmentIndex = 0
    @IBOutlet weak var titleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let localData = UserDefaults.standard.object(forKey: "titleModel")
        
        if localData != nil {
            self.titleModel = try! JSONDecoder().decode(TitleModel.self, from: localData as! Data)
            self.configSegmentedColtrol()
            self.titleTableView.reloadData()
        }
        
        self.requestData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        segmentedControl.removeFromSuperview();
    }
    
    func requestData() -> Void {
        var request = URLRequest(url: URL(string: "https://www.anyknew.com/api/v1/sites/" + keySite)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        Alamofire.request(request).responseJSON {
            (response) in
            switch response.result {

            case .success( _) :

                self.titleModel = try! JSONDecoder().decode(TitleModel.self, from: response.data!)
                if self.titleModel.status != 0 { return }
                self.configSegmentedColtrol()
                UserDefaults.standard.set(response.data!, forKey: "titleModel")
                self.titleTableView.reloadData()
                
                break
            case .failure( _):
                break
            }
        }
    }
    
    func configSegmentedColtrol() -> Void {
        self.navigationController?.navigationBar.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        segmentedControl.removeAllSegments()
        if titleModel.data?.site?.subs?.count ?? 1 > 1 {
            for (index,element) in (titleModel.data?.site?.subs?.enumerated())! {
                segmentedControl.insertSegment(withTitle: element.attrs?.cn , at: index, animated: true)
            }
        }
        segmentedControl.selectedSegmentIndex = selectedSegmentIndex;
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: UIControl.Event.valueChanged)
    }
    
    func segmentedColtrolLoadData() -> Void {
       
    }

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        titleTableView.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
        selectedSegmentIndex = sender.selectedSegmentIndex
        titleTableView.reloadData()
    }
    
}

extension TitleListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleModel.data?.site?.subs?[selectedSegmentIndex].items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleListViewControllerCell
        cell.layoutSubviewsWithModel(model: (titleModel.data?.site?.subs?[selectedSegmentIndex].items?[indexPath.row] ?? nil)!, indexPath:indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: SourceWebViewController = SourceWebViewController.init()
        vc.iid = String(titleModel.data?.site?.subs?[selectedSegmentIndex].items?[indexPath.row].iid ?? 0)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
