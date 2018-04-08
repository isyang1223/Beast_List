//
//  ViewController.swift
//  Beast List
//
//  Created by Ian Yang on 3/11/18.
//  Copyright © 2018 Ian Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate  {
    
    var tasks = ["a", "b", "c"]
    
    
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func beastButton(_ sender: UIButton) {
        let input: String? = taskTextField.text
        if let unwrappedinput = input {
            if unwrappedinput != "" {
                tasks.append(unwrappedinput)
                tableView.reloadData()
                taskTextField.text = ""
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
}

