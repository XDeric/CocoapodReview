//
//  ViewController.swift
//  Review_Olimpia_11_7_19
//
//  Created by EricM on 11/7/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class ViewController: UIViewController {
    
    var objects = [LibraryWrapper]()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        table.frame = view.bounds
        table.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        }()
    
    
    func loadData(){
        objects = LibraryWrapper.getLibraries(from:  GetLocation.getData(name: "Library", type: "json"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        loadData()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objectsToSet = objects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = objectsToSet.title
        //create button
        cell.leftButtons = [MGSwipeButton(title: "Add", icon: UIImage(named: "test") , backgroundColor: .lightGray, callback: {(cell)->
            Bool in
            print("add action")
            return true
        })]
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: .red, callback: { (cell) -> Bool in
            self.objects.remove(at: indexPath.row)
            let indexPath = IndexPath(item: indexPath.row,section: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            return true
        })]
        
        cell.layer.cornerRadius = 25
        cell.backgroundColor = #colorLiteral(red: 0.7394374013, green: 0.6397964358, blue: 0.9213000536, alpha: 1)
        cell.clipsToBounds = true
        cell.layoutIfNeeded()
        
        //another button
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
