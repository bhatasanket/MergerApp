//
//  MergeViewController.swift
//  MergerApp
//
//  Created by sanket bhat on 6/9/18.
//  Copyright © 2018 sanket bhat. All rights reserved.
//

import UIKit

class MergeViewController: UIViewController {

    @IBOutlet weak var mergeResult: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var HHIValue: UILabel!
    @IBOutlet weak var CR4Value: UILabel!
    @IBOutlet weak var concentrationValue: UILabel!
    var hhi = 0.0
    var oldhhi = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatestuff()
        if marketShares.count > 0{
            // Do any additional setup after loading the view.
//            if mergedMarketShares.count == 0 {
            mergedMarketShares.removeAll()
            mergedMarketShares.append(contentsOf: marketShares)
//            }
            calculatestuff()
        }
        
    }
    
    func calculatestuff(){
        oldhhi = hhi
        hhi = 0
        for firm in mergedMarketShares {
            hhi = hhi + firm.value * firm.value
        }
        let hhiChange = oldhhi == 0 ? 0 : hhi - oldhhi
        mergeResult.text = "HHI changed by \(hhiChange)."
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
        if hhiChange <= 100 && hhiChange > 0 {
            mergeResult.text = "\(mergeResult.text!) No adverse competitive effects and ordinarily require no further analysis."
        }
        if (concentrationValue.text == "Moderate" || concentrationValue.text == "High") && hhiChange > 100 && hhiChange <= 200 {
            mergeResult.text = "\(mergeResult.text!) Potentially raise significant competitive concerns and often warrant scrutiny."
        }
        if concentrationValue.text == "High" && hhiChange > 200 {
            mergeResult.text = "\(mergeResult.text!) Presumed to be likely to enhance market power. Potentially raise significant competitive concerns and often warrant scrutiny."
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MergeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mergedMarketShares.count < 1 ? 1 : mergedMarketShares.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Pacifico", size: 13)
        if marketShares.count < 1 {
            cell.textLabel?.text = "No data found"
            return cell
        }
        cell.textLabel?.text = "\(mergedMarketShares[indexPath.row].name) - \(mergedMarketShares[indexPath.row].value)%"
        return cell
    }
    
    @IBAction func unwindSegueToMerge(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CheckViewController {
            // Add a new course\
            var name = ""
            var value = 0.0
            for firm in mergedMarketShares{
                if sourceViewController.selected.contains(firm.name){
                    name = name == "" ?"\(firm.name)" : "\(name)-\(firm.name)"
                    value = value + firm.value
                    mergedMarketShares.remove(at: mergedMarketShares.index(where: {$0.name == firm.name})!)
                }
            }
            mergedMarketShares.append(Share(name: name, value: value))
            tableView.reloadData()
            calculatestuff()
        }
        
    }

}
