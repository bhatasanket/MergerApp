//
//  ViewController.swift
//  MergerApp
//
//  Created by sanket bhat on 6/9/18.
//  Copyright © 2018 sanket bhat. All rights reserved.
//

import UIKit

struct Share {
    var name = ""
    var value = 0.0
}

var marketShares: [Share] = []
var mergedMarketShares: [Share] = []

class ViewController: UIViewController {

    var sumOfShares = 0.0
    @IBOutlet weak var firm1: UITextField!
    @IBOutlet weak var val1: UITextField!
    
    @IBOutlet weak var firm2: UITextField!
    @IBOutlet weak var val2: UITextField!
    
    @IBOutlet weak var firm3: UITextField!
    @IBOutlet weak var val3: UITextField!
    
    @IBOutlet weak var firm4: UITextField!
    @IBOutlet weak var val4: UITextField!
    
    @IBOutlet weak var firm5: UITextField!
    @IBOutlet weak var val5: UITextField!
    
    @IBOutlet weak var firm6: UITextField!
    @IBOutlet weak var val6: UITextField!
    
    @IBOutlet weak var firm7: UITextField!
    @IBOutlet weak var val7: UITextField!
    
    @IBOutlet weak var firm8: UITextField!
    @IBOutlet weak var val8: UITextField!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func unwindSegue(sender: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateDetails(_ sender: UIButton) {
        marketShares.removeAll()
        
        if let name = firm1.text, let value = Double(val1.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm1.text = ""
                return
            }
            sumOfShares = 0.0
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm2.text, let value = Double(val2.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm2.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm3.text, let value = Double(val3.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm3.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm4.text, let value = Double(val4.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm4.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm5.text, let value = Double(val5.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm5.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm6.text, let value = Double(val6.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm6.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm7.text, let value = Double(val7.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm7.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if let name = firm8.text, let value = Double(val8.text!) {
            if name == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "Name cannot be blank", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                firm8.text = ""
                return
            }
            sumOfShares = sumOfShares + value
            marketShares.append(Share(name: name, value: value))
        }
        if sumOfShares > 100 {
            let alert = UIAlertController(title: "Sum of Shares invalid", message: "Sum of Shares cannot be more than 100%", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "segue1", sender: self)
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = Double(textField.text!){
            if value > 100 {
                let alert = UIAlertController(title: "Invalid Share", message: "Shares % cannot be more than 100", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
                textField.text = ""
                return
            }
        }
    }
}

