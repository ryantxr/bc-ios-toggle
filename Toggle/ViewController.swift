//
//  ViewController.swift
//  Toggle
//
//  Created by ryan teixeira on 11/6/17.
//  Copyright © 2017 Blazecore. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allSwitch.addTarget(self, action: #selector(ViewController.switchValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChange(_ sender: Any) {
        print("one of the switches was changed")
        // If its value is "on" turn off the All switch
        let b = sender as! UISwitch
        if b.isOn {
            allSwitch.isOn = false
        }
    }
    
    weak var theAllSwitch : UISwitch?
    struct SwitchInfo {
        var label: String
        var isOn: Bool
    }
    let tableData = [
        SwitchInfo(label: "All", isOn: true),
        SwitchInfo(label: "Class A", isOn: false),
        SwitchInfo(label: "Class B", isOn: false),
        SwitchInfo(label: "Class C", isOn: false),
        SwitchInfo(label: "Class D", isOn: false),
        SwitchInfo(label: "Class E", isOn: false)
    ]
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        print("one of the switches in the table was changed")
        // If its value is "on" turn off the All switch
        if sender.isOn {
            theAllSwitch?.isOn = false
        }
        if let row = sender.row {
            print("row is \(row)")
        }
    }
    // MARK: - Table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "switch-cell") as! SwitchTableViewCell
        let info = tableData[indexPath.row]
        cell.row = indexPath.row
        cell.label.text = info.label
        cell.uiSwitch.isOn = info.isOn
        if info.label == "All" {
            // Remember which one is the All switch so we can controll it later.
            theAllSwitch = cell.uiSwitch
        } else {
            // Only attach to switches that are not the "All" switch
            cell.uiSwitch.addTarget(self, action: #selector(ViewController.switchValueChanged(_:)), for: .valueChanged)
            cell.uiSwitch.row = indexPath.row
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // this is the row that was selected
        // indexPath.row
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    
}

