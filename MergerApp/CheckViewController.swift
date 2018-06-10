//
//  CheckViewController.swift
//  MergerApp
//
//  Created by sanket bhat on 6/9/18.
//  Copyright © 2018 sanket bhat. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    var selected: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension CheckViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mergedMarketShares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "fcell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Pacifico", size: 13)
        cell.textLabel?.text = "\(mergedMarketShares[indexPath.row].name) - \(mergedMarketShares[indexPath.row].value)%"
        return cell
    }
    
    
}

extension CheckViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
            selected.remove(at: selected.index(of: (tableView.cellForRow(at: indexPath)?.textLabel?.text)!)!)
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            selected.append(mergedMarketShares[indexPath.row].name)
        }
    }
}
