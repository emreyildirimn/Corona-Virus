//
//  ViewController.swift
//  deneme
//
//  Created by mac on 30.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController , UISearchBarDelegate , UITableViewDelegate , UITableViewDataSource {
    var index = 0
    let startJsonDownloader = json ()
    var searchingCountries : [String] = []
    var countriesInOrder : [String] = []
    var searchingNow : Bool = false
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        startJsonDownloader.jsonStepTwo()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchingNow == true {
            return searchingCountries.count
        } else {
            return countriesInOrder.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if searchingNow == true {
        cell.textLabel?.text = searchingCountries[indexPath.row]
        } else {
        cell.textLabel?.text = countriesInOrder [indexPath.row]
        }
      //  tableView.reloadData()
        return cell
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNow = true
        searchingCountries = countriesInOrder.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchingNow = false
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
               if searchingNow == false {
                    index = startJsonDownloader.countries.firstIndex(of: countriesInOrder[indexPath.row])!
               }
               else{
                    index = startJsonDownloader.countries.firstIndex(of: searchingCountries[indexPath.row])!
               }
       performSegue(withIdentifier: "secondSegue", sender: self)
    }

    @objc func refresh() {
        DispatchQueue.main.async {
            self.countriesInOrder = self.startJsonDownloader.countries.sorted(by: <)
            self.tableView.reloadData()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : SecondViewController = segue.destination as! SecondViewController
        destVC.values.append(startJsonDownloader.countries[index])
        destVC.values.append(startJsonDownloader.totalCases[index])
        destVC.values.append(startJsonDownloader.newCases[index])
        destVC.values.append(startJsonDownloader.totalDeath[index])
        destVC.values.append(startJsonDownloader.newDeaths[index])
        destVC.values.append(startJsonDownloader.totalRecovered[index])
        destVC.values.append(startJsonDownloader.activeCases[index])
    }
}

