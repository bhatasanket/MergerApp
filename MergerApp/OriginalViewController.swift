//
//  OriginalViewController.swift
//  MergerApp
//
//  Created by sanket bhat on 6/9/18.
//  Copyright © 2018 sanket bhat. All rights reserved.
//

import UIKit

class OriginalViewController: UIViewController {

    @IBOutlet weak var HHIValue: UILabel!
    @IBOutlet weak var CR4Value: UILabel!
    @IBOutlet weak var concentrationValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var hhi = 0.0
        for firm in marketShares {
            hhi = hhi + firm.value * firm.value
        }
        HHIValue.text = String(hhi)
        
        var cr4 = 0.0
        for firm in mergedMarketShares.sorted(by: {$0.value > $1.value}).prefix(4) {
            cr4 = cr4 + firm.value
        }
        CR4Value.text = String(cr4)
        
        switch hhi {
        case 1...1500:
            concentrationValue.text = "Unconcentrated"
        case 1501...2500:
            concentrationValue.text = "Moderate"
        case 2501...10000:
            concentrationValue.text = "High"
        default:
            concentrationValue.text = ""
        }
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

}
extension OriginalViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketShares.count < 1 ? 1 : marketShares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Pacifico", size: 13)
        if marketShares.count == 0 {
            cell.textLabel?.text = "No data found"
            return cell
        }
        cell.textLabel?.text = "\(marketShares[indexPath.row].name) - \(marketShares[indexPath.row].value)%"
        return cell
    }
    
    
}
