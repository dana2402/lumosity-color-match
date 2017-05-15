//
//  SecondVC.swift
//  lumosity Color Match
//
//  Created by Dana Goldberg on 4/6/17.
//  Copyright © 2017 Dana Goldberg. All rights reserved.
//

import UIKit

class SecondVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var results : [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan

        tableView.delegate = self
        tableView.dataSource = self
        
        
        results = UserDefaults.standard.value(forKey: "results") as? [Int]
        if (results != nil){
            tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (results?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell")
        cell?.textLabel?.text = String(describing: results?[indexPath.row])
        return cell!
    }
    
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


